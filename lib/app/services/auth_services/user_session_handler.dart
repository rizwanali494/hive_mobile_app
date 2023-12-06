import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/refresh_token_exception.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/get_it/api_service_instance.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/navigation/router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/services/web_socket_services/web_socket_service.dart';
import 'package:hive_mobile/features/authentication/screens/sign_in_screen.dart';
import 'package:hive_mobile/features/email_verification/screens/email_verification_screen.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

mixin UserSessionHandler {
  final _sharedPref = GetIt.instance.get<SharedPreferences>();
  final _userModelService = IsarService<UserModel>();

  Future<String> refreshToken() async {
    try {
      String refreshToken = await _sharedPref.getString("refresh_Token") ?? "";
      if (refreshToken.isEmpty) {
        throw AppStrings.somethingWentWrong;
      }
      final body = {"refresh": refreshToken};
      final url = ApiEndpoints.refreshToken;
      final response = await http.post(url.parsedUri, body: body);
      final responseBody = jsonDecode(response.body);
      final statusCode = response.statusCode;
      if(  statusCode > 201 ){
        throw RefreshTokenException() ;
      }
      String newToken = responseBody["access"];
      await _sharedPref.setString("token", newToken);
      registerApiServiceInstance(token: newToken);
      return newToken;
    } catch (e) {
      log("error refreshing ${e.toString()}");
      rethrow;
    }
  }

  Future<void> sessionExpiredLogout() async {
    _sharedPref.remove("token");
    _sharedPref.remove("refresh_Token");
    IsarService<UserModel>().clearCollection();
    registerApiServiceInstance();
    final router = goRouter;
    while (router.canPop()) {
      router.pop();
    }
    router.pushReplacement(SignInScreen.route);
    // UtilFunctions.showToast(msg: AppStrings.pleaseSignIn);
    disconnectSocketConnections();
  }

  Future<void> manualLogout() async {
    _sharedPref.remove("token");
    _sharedPref.remove("refresh_Token");
    IsarService<UserModel>().clearCollection();
    registerApiServiceInstance();
    final router = goRouter;
    while (router.canPop()) {
      router.pop();
    }
    router.pushReplacement(SignInScreen.route);
    disconnectSocketConnections();
  }

  Future<void> createUserSession(
      {required String token,
      required UserModel userModel,
      required String refreshToken,
      required BuildContext context}) async {
    registerApiServiceInstance(token: token);
    await registerUserModel(userModel);
    await Future.wait([
      _sharedPref.setString("token", token),
      _sharedPref.setString("refresh_Token", refreshToken)
    ]);
    checkEmailVerification(context, userModel);
    _userModelService.clearCollection().then((value) {
      _userModelService.put(userModel).then((value) => connectSockets());
      return;
    });
  }

  void checkEmailVerification(BuildContext context, UserModel model) {
     if ((model.accountData?.isBackUpEmailVerified ?? false)) {
      context.pushReplacement(HomeScreen.route);
      return;
    }
    context.pushReplacement(EmailVerificationScreen.route);
  }

  Future<void> login(
      BuildContext context, UserModel model, String token) async {
    await registerUserModel(model);
    await registerApiServiceInstance(token: token);
    connectSockets();
    checkEmailVerification(context, model);
  }

  void disconnectSocketConnections() {
    GetIt.instance.get<WebSocketService>().disconnectAll();
  }

  void connectSockets() {
    GetIt.instance.get<WebSocketService>().connect();
  }
}
