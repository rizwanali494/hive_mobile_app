import 'dart:convert';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/get_it/api_service_instance.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

mixin AuthTokenHandler {
  final _sharedPref = GetIt.instance.get<SharedPreferences>();

  Future<String> refreshToken(String token) async {
    try {
      String refreshToken = await _sharedPref.getString("refresh_Token") ?? "";
      if (refreshToken.isEmpty) {
        throw AppStrings.somethingWentWrong;
      }
      final body = {"token": token};
      final url = ApiEndpoints.refreshToken;
      final response = await http.post(url.parsedUri, body: body);
      final responseBody = jsonDecode(response.body);
      String newToken = responseBody["access"];
      await _sharedPref.setString("token", newToken);
      registerApiServiceInstance(token: newToken);
      log("token Refreshed : ${newToken}");
      return newToken;
    } catch (e) {
      throw AppStrings.somethingWentWrong;
    }
  }
}
