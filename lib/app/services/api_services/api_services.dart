import 'dart:io';

import 'package:http/http.dart';

abstract class ApiService {
  Future<Response> get({required String url, String? queryParameters});

  Future<Response> post(
      {required String url, required Object body, String? queryParameters});

  Future<Response> patch(
      {required String url, required Object body, String? queryParameters});

  Future<Response> delete({required String url, String? queryParameters});

  Future<Response> getResponse({required Response response});

  Future<Response> uploadSingleFile({
    required File file,
    required String purpose,
    Map<String, String>? headers,
  });
}
