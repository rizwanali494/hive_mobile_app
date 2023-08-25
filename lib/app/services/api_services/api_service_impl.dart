import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:http/http.dart' as http;

class ApiServiceImpl extends ApiService {
  String? _token;
  late Map<String, String> _headers;

  ApiServiceImpl({String? token}) {
    this._token = token;
    _headers = {"Content-Type": "application/json"};
    if (_token != null) {
      _headers["Authorization"] = "Bearer ${_token!}";
    }
  }

  @override
  Future<http.Response> get(
      {required String url,
      Map<String, String>? headers,
      String? queryParameters}) async {
    http.Response response;
    url = "$url${queryParameters ?? ""}";
    try {
      response =
          await http.get(url.parsedUri, headers: headers ?? this._headers);
      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<http.Response> post(
      {required String url,
      required Map body,
      Map<String, String>? headers,
      String? queryParameters}) async {
    http.Response response;
    debugPrint(url.parsedUri.toString());
    url = "$url${queryParameters ?? ""}";

    try {
      response = await http.post(url.parsedUri,
          body: jsonEncode(body), headers: headers ?? this._headers);
      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<http.Response> patch(
      {required String url,
      required Map body,
      Map<String, String>? headers,
      String? queryParameters}) async {
    http.Response response;
    url = "$url${queryParameters ?? ""}";
    try {
      response = await http.patch(url.parsedUri,
          body: jsonEncode(body), headers: headers ?? this._headers);
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
    required String url,
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
    var response = await http.Response.fromStream(streamedResponse);
    return getResponse(response: response);
  }
}
