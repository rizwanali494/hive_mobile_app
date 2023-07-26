import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/user_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/auth_services/auth_service.dart';
import 'package:hive_mobile/app/services/auth_services/google_auth_service.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';

class AuthVM extends ChangeNotifier with BaseExceptionController {
  GetIt getIt = GetIt.instance;
  late ApiService apiService;

  AuthVM() {
    apiService = getIt.get<ApiService>();
  }

  Future googleSignIn(BuildContext context) async {
    AuthService authService = GoogleAuthService();
    // await authService.logOut();
    var user = await authService.logIn().timeout(Duration(seconds: 5));
    if (user == null) {
      debugPrint("null");
    }
    if (user != null) {
      // var body = {
      //   "payload": {"email": "$user", "email_verified": true}
      // };
      var body = {
        "payload": {
          "email": "bcp.test1@beaconite.edu.pk",
          "email_verified": true
        }
      };
      try {
        var response = await apiService.post(
          url: ApiEndpoints.googleLogin,
          body: body,
        );
        var responseBody = jsonDecode(response.body);
        var model = UserModel.fromJson(responseBody);
        registerUserModel(model);
        context.pushReplacement(HomeScreen.route);
      } catch (e) {
        handleException(e);
      }


      // if (kDebugMode || kProfileMode) {
      //   context.pushReplacement(HomeScreen.route);
      //   return;
      // }
      // var user = await authService.logIn();
      // if ((context.mounted && user != null)) {
      //   context.pushReplacement(HomeScreen.route);
      // }
    }
  }
}