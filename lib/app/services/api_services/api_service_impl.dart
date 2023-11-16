import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/exceptions/refresh_token_exception.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/auth_services/user_session_handler.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ApiServiceImpl extends ApiService with UserSessionHandler {
  String? _token;
  late Map<String, String> _headers;

  ApiServiceImpl({String? token}) {
    this._token = token;
    _headers = {"Content-Type": "application/json"};
    if (_token != null) {
      _headers["Authorization"] = "Bearer ${_token!}";
    }
  }

  final client = http.Client();
  static const _retryCount = 2;

  // late final RetryClient retryClient = RetryClient(
  //   client,
  //   retries: _retryCount,
  //   delay: (retryCount) => Duration(milliseconds: 500),
  //   // when: (p0) => true,
  //   when: (p0) => p0.statusCode == 401,
  //   onRetry: (p0, p1, retryCount) async {
  //     log("Current Token ${_token}");
  //     _token = await refreshToken();
  //     log("Got new Token ::::: ${_token}");
  //     if (retryCount == _retryCount - 1) {
  //       sessionExpiredLogout();
  //       return;
  //     }
  //   },
  // );

  @override
  Future<http.Response> get(
      {required String url,
      Map<String, String>? headers,
      String? queryParameters}) async {
    url = "$url${queryParameters ?? ""}";
    try {
      final response = await performRetryRequest(() async {
        return await client.get(url.parsedUri,
            headers: headers ?? this._headers);
      });
      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<http.Response> post(
      {required String url,
      required Object body,
      Map<String, String>? headers,
      String? queryParameters}) async {
    debugPrint(url.parsedUri.toString());
    url = "$url${queryParameters ?? ""}";
    try {
      final response = await performRetryRequest(() async {
        return await client.post(url.parsedUri,
            body: jsonEncode(body), headers: headers ?? this._headers);
      });
      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<http.Response> patch(
      {required String url,
      required Object body,
      Map<String, String>? headers,
      String? queryParameters}) async {
    url = "$url${queryParameters ?? ""}";
    try {
      final response = await performRetryRequest(() async {
        return await client.patch(url.parsedUri,
            body: jsonEncode(body), headers: headers ?? this._headers);
      });

      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<http.Response> getResponse({required http.Response response}) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    }
    throw HTTPStatusCodeException(response: response);
  }

  @override
  Future<http.Response> uploadSingleFile({
    required File file,
    required String purpose,
    Map<String, String>? headers,
  }) async {
    var postUri = Uri.parse(ApiEndpoints.upload);
    var request = new http.MultipartRequest("POST", postUri);
    request.headers.addAll(headers ?? this._headers);
    request.headers.addAll({"Content-Type": "multipart/form-data"});
    request.fields['purpose'] = purpose;
    log(file.path);
    log(request.headers.toString());
    var multipartFile = await http.MultipartFile.fromPath('file', file.path);
    request.files.add(
      multipartFile,
    );
    var streamedResponse = await client.send(request);
    final response = await performRetryRequest(() async {
      return await http.Response.fromStream(streamedResponse);
    });

    return getResponse(response: response);
  }

  @override
  Future<http.Response> delete(
      {required String url,
      Map<String, String>? headers,
      String? queryParameters}) async {
    url = "$url${queryParameters ?? ""}";
    try {
      final response = await performRetryRequest(() async {
        return await client.delete(url.parsedUri,
            headers: headers ?? this._headers);
      });

      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  static const _timeoutDurationMinutes = 2;

  // Future<http.Response> performHttpRequest(httpRequest request) async {
  //   return await request
  //       .call()
  //       .timeout(Duration(minutes: _timeoutDurationMinutes));
  // }

  Future<http.Response> performRetryRequest(httpRequest request) async {
    int retries = 1;
    for (;;) {
      log("hitting ${retries}");
      final req = await request
          .call()
          .timeout(Duration(minutes: _timeoutDurationMinutes));
      int statusCode = req.statusCode;
      if (retries == _retryCount) {
        return getResponse(response: req);
      }
      await refreshUserToken();
      if (statusCode == 401) {
        await refreshUserToken();
      } else {
        return getResponse(response: req);
      }
      retries++;
    }
  }

  Future<void> refreshUserToken() async {
    try {
      _token = await refreshToken();
    } catch (error) {
      if( error is HTTPStatusCodeException ) {
        sessionExpiredLogout();
        throw RefreshTokenException();
      }
      throw error;
    }
  }
}

typedef httpRequest = Future<http.Response> Function();
