import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
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

  Future<http.Response> updateBackupEmail(
      {required Map body, required int id}) async {
    // final url = ApiEndpoints.studentUser.withId(id);
    final url = ApiEndpoints.verifyEmail;
    final response = await apiService.patch(url: url, body: body);
    return response;
  }

  Future<UserModel> fetchProfile() async {
    final url = ApiEndpoints.me;
    final response = await apiService.get(url: url);
    final body = jsonDecode(response.body);
    return UserModel.fromJson(body);
  }
}
