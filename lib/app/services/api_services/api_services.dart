import 'package:http/http.dart';

abstract class ApiService {
  Future<Response> get({required String url, String? queryParameters});

  Future<Response> post(
      {required String url, required Map body, String? queryParameters});

  Future<Response> patch(
      {required String url, required Map body, String? queryParameters});

  Future<Response> getResponse({required Response response});
}
