import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/get_it/api_service_instance.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
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
      // var body = {
      //   "payload": {"email": "${user.email}", "email_verified": true}
      // };
      //test email
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

const _model = {
  "id": 1,
  "picture": {
    "id": "6c783f816e1693999058",
    "date_added": "2023-09-06T11:17:38.886764Z",
    "date_last_modified": "2023-09-06T11:17:38.886787Z",
    "file":
        "http://hive.bcp.net.pk/media/saqib.manzoor%40bh.edu.pk/profile_picture/image/6c783f816e1693999058.jpg",
    "purpose": "PROFILE_PICTURE",
    "label": "image_picker_crop_39ea4b8f-8651-4bd7-970c-324875a56764.jpg",
    "mime_type": "image/jpeg",
    "owner": 1
  },
  "account_data": {
    "id": 278,
    "extra": {
      "branch_id": 225,
      "class_id": 18,
      "section_id": 9,
      "region_id": null,
      "city_id": null
    },
    "hobbies": [],
    "date_added": "2023-09-22T09:56:05.512476Z",
    "date_last_modified": "2023-09-22T09:56:05.512496Z",
    "branch_id": 225,
    "region_id": null,
    "city_id": null,
    "bio": null,
    "backup_email": null,
    "class_id": 18,
    "section_id": 9,
    "owner": 1
  },
  "last_login": "2023-09-25T06:41:23.762035Z",
  "date_added": "2023-08-23T06:29:15.792252Z",
  "date_last_modified": "2023-09-25T06:38:11.582378Z",
  "is_active": true,
  "date_joined": "2023-08-23T06:29:15.791748Z",
  "email": "saqib.manzoor@bh.edu.pk",
  "account_type": "STUDENT",
  "is_email_verified": true,
  "is_test_user": false
};
