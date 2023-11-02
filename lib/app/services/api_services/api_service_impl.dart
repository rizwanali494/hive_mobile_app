import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/navigation/router.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/auth_services/auth_token_handler.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/authentication/screens/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ApiServiceImpl extends ApiService with AuthTokenHandler {
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

  late final RetryClient retryClient = RetryClient(
    client,
    retries: _retryCount,
    delay: (retryCount) => Duration(milliseconds: 500),
    // when: (p0) => true,
    when: (p0) => p0.statusCode == 401,
    onRetry: (p0, p1, retryCount) async {
      log("Current Token ${_token}");
      _token = await refreshToken(_token ?? "");
      log("Got new Token ::::: ${_token}");
      if (retryCount == _retryCount - 1) {
        logout();
        return;
      }
    },
  );

  @override
  Future<http.Response> get(
      {required String url,
      Map<String, String>? headers,
      String? queryParameters}) async {
    http.Response response;
    url = "$url${queryParameters ?? ""}";
    try {
      final response = await performHttpRequest(() async {
        return await retryClient.get(url.parsedUri,
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
    http.Response response;
    debugPrint(url.parsedUri.toString());
    url = "$url${queryParameters ?? ""}";
    try {
      final response = await performHttpRequest(() async {
        return await retryClient.post(url.parsedUri,
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
    http.Response response;
    url = "$url${queryParameters ?? ""}";
    try {
      final response = await performHttpRequest(() async {
        return await retryClient.patch(url.parsedUri,
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
    var streamedResponse = await request.send();
    // var streamedResponse = await retryClient.send(request);
    final response = await performHttpRequest(() async {
      return await http.Response.fromStream(streamedResponse);
    });

    return getResponse(response: response);
  }

  @override
  Future<http.Response> delete(
      {required String url,
      Map<String, String>? headers,
      String? queryParameters}) async {
    http.Response response;
    url = "$url${queryParameters ?? ""}";
    try {
      final response = await performHttpRequest(() async {
        return await retryClient.delete(url.parsedUri,
            headers: headers ?? this._headers);
      });

      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  Future<http.Response> performHttpRequest(httpRequest request) async {
    return await request.call().timeout(Duration(seconds: 30));
  }
}

typedef httpRequest = Future<http.Response> Function();
