import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

  Future<http.Response> login(Map body) async {
    final url = ApiEndpoints.googleLogin;
    final response = await apiService.post(url: url, body: body);
    return response;
  }
}
