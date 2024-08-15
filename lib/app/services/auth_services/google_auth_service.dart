import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_mobile/app/models/user_auth_model.dart';
import 'package:hive_mobile/app/services/auth_services/auth_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';

class GoogleAuthService extends AuthService {
  final _googleSign = GoogleSignIn();

  @override
  Future<UserAuthModel?> logIn() async {
    try {
      var user = await _googleSign.signIn();
      if (user != null) {
        return UserAuthModel(email: user.email);
      }
    } catch (error) {
      if (error is PlatformException) {
        if (error.code == "network_error") {
          UtilFunctions.showToast(msg: "No Internet Connection");
        } else {
          UtilFunctions.showToast(msg: error.toString());
        }
      } else {
        UtilFunctions.showToast(msg: error.toString());
      }
    }

    return null;
  }

  @override
  Future<void> logOut() async {
    await _googleSign.signOut();
  }
}
