import 'package:http/http.dart';

abstract class ApiService {
  Future<Response> get({required String url});

  Future<Response> post({required String url, required Map body});

  Future<Response> patch({required String url, required Map body});
}
