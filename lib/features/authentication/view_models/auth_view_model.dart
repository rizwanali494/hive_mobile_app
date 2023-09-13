import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/get_it/api_service_instance.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/user_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/auth_services/auth_service.dart';
import 'package:hive_mobile/app/services/auth_services/google_auth_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';

class AuthVM extends ChangeNotifier
    with BaseExceptionController, UtilFunctions {
  GetIt getIt = GetIt.instance;
  late ApiService apiService;

  AuthVM() {
    apiService = getIt.get<ApiService>();
  }

  bool loggingIn = false;

  Future googleSignIn(BuildContext context) async {
    if (loggingIn) {
      return;
    }
    loggingIn = true;
    AuthService authService = GoogleAuthService();
    await authService.logOut();
    showLoaderDialog(context);
    var user = await authService.logIn();
    if (user is GoogleSignInAccount) {
      var body = {
        "payload": {"email": "saqib.manzoor@bh.edu.pk", "email_verified": true}
      };
      try {
        var response = await apiService.post(
          url: ApiEndpoints.googleLogin,
          body: body,
        );
        var responseBody = jsonDecode(response.body);
        var model = UserModel.fromJson(responseBody);
        var token = responseBody["token"]["access"];
        log(token.toString());
        registerApiServiceInstance(token: token);
        registerUserModel(model);
        context.pushReplacement(HomeScreen.route);
        return;
      } catch (e) {
        log(e.toString());
        handleException(e, context: context);
      }
      if (context.mounted) {
        context.pop();
      }
    }
    loggingIn = false;
  }
}
