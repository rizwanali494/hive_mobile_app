import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_mobile/app/models/user_auth_model.dart';
import 'package:hive_mobile/app/services/auth_services/auth_service.dart';

class GoogleAuthService extends AuthService {
  final _googleSign = GoogleSignIn();

  @override
  Future<UserAuthModel?> logIn() async {
    var user = await _googleSign.signIn();
    if (user != null) {
      return UserAuthModel(email: user.email);
    }
    return null;
  }

  @override
  Future<void> logOut() async {
    await _googleSign.signOut();
  }
}
