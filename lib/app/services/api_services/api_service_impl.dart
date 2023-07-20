import 'dart:convert';

import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:http/http.dart' as http;

class ApiServiceImpl extends ApiService {
  @override
  Future<http.Response> get(
      {required String url, Map<String, String>? headers}) async {
    http.Response response;
    try {
      response = await http.get(url.parsedUri, headers: headers);
    } catch (e) {
      throw AppStrings.somethingWentWrong;
    }
    return response;
  }

  @override
  Future<http.Response> post(
      {required String url,
      required Map body,
      Map<String, String>? headers}) async {
    http.Response response;
    try {
      response = await http.post(url.parsedUri,
          body: jsonEncode(body), headers: headers);
    } catch (e) {
      throw AppStrings.somethingWentWrong;
    }
    return response;
  }

  @override
  Future<http.Response> patch(
      {required String url,
      required Map body,
      Map<String, String>? headers}) async {
    http.Response response;
    try {
      response = await http.patch(url.parsedUri, body: body, headers: headers);
    } catch (e) {
      throw AppStrings.somethingWentWrong;
    }
    return response;
  }
}
