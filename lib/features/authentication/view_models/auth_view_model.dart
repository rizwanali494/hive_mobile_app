import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/get_it/api_service_instance.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/repositories/user_repository.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/auth_services/auth_service.dart';
import 'package:hive_mobile/app/services/auth_services/google_auth_service.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthVM extends ChangeNotifier
    with BaseExceptionController, UtilFunctions {
  GetIt getIt = GetIt.instance;
  late ApiService apiService;

  AuthVM() {
    apiService = getIt.get<ApiService>();
  }

  bool loggingIn = false;

  final isarService = IsarService<UserModel>();
  final sharedPref = GetIt.instance.get<SharedPreferences>();
  late final userRepository = UserRepository(apiService: apiService);

  AuthService? authService;

  Future signIN(AuthService service,BuildContext context) async {
    if (loggingIn) {
      return;
    }
    loggingIn = true;
    authService = service;
    // await authService?.logOut();
    showLoaderDialog(context);
    var user = await authService?.logIn();
    if (user != null) {
      if (user.email == null) {
        UtilFunctions.showToast(msg: "Email not provided");
        return;
      }
      //test email
      // var body = {
      //   "payload": {"email": "saqib.manzoor@bh.edu.pk", "email_verified": true}
      // };
      // // var body = {
      // //   "payload": {
      // //     "email": "zunair.8831@beaconite.edu.pk",
      // //     "email_verified": true
      // //   }
      // // };
      Map body = {};
      if (kDebugMode) {
        body = {
          "payload": {
            "email": "saqib.manzoor@bh.edu.pk",
            "email_verified": true
          }
        };
      } else {
        body = {
          "payload": {"email": "${user.email}", "email_verified": true}
        };
      }

      try {
        final response = await userRepository.login(body);

        var responseBody = jsonDecode(response.body);
        var model = UserModel.fromJson(responseBody);
        log('got it');
        var token = responseBody["token"]["access"];
        log(token.toString());
        registerApiServiceInstance(token: token);
        registerUserModel(model);
        context.pushReplacement(HomeScreen.route);
        await sharedPref.setString("token", token);
        isarService.clearCollection().then((value) {
          isarService.put(model);
          return;
        });
        return;
      } catch (e) {
        log(e.toString());
        handleException(e);
      }
      if (context.mounted) {
        context.pop();
      }
    } else {
      context.pop();
    }
    loggingIn = false;
  }
}
