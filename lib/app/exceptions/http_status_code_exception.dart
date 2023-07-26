import 'package:http/http.dart' as http;

class HTTPStatusCodeException implements Exception {
  http.Response response;

  HTTPStatusCodeException({required this.response});
}
