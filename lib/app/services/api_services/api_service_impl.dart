import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:http/http.dart' as http;

class ApiServiceImpl extends ApiService {
  final headers = {"Content-Type": "application/json"};

  @override
  Future<http.Response> get(
      {required String url, Map<String, String>? headers}) async {
    http.Response response;
    try {
      response =
          await http.get(url.parsedUri, headers: headers ?? this.headers);
      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<http.Response> post({required String url,
    required Map body,
    Map<String, String>? headers}) async {
    http.Response response;
    debugPrint(url.parsedUri.toString());
    try {
      response = await http.post(url.parsedUri,
          body: jsonEncode(body), headers: headers ?? this.headers);
      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<http.Response> patch({required String url,
    required Map body,
    Map<String, String>? headers}) async {
    http.Response response;
    try {
      response = await http.patch(url.parsedUri,
          body: body, headers: headers ?? this.headers);
      return getResponse(response: response);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<http.Response> getResponse({required http.Response response}) async {
    if (response.statusCode == 200) {
      return response;
    }
    throw HTTPStatusCodeException(response: response);
  }
}
