import 'package:http/http.dart' as http;

class HTTPStatusCodeException implements Exception {
  http.Response response;

  HTTPStatusCodeException({required this.response});

  @override
  String toString() {
    return 'HTTPStatusCodeException{response status code: ${response.statusCode}} \n body: ${response.body}';
  }
}
