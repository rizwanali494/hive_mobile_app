import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_mobile/app/services/auth_services/auth_service.dart';

class GoogleAuthService extends AuthService {
  final _googleSign = GoogleSignIn();

  @override
  Future<String?> logIn() async {
    var user = await _googleSign.signIn();
    if (user == null) {
      debugPrint("user null");
    }
    return user?.id;
  }

  @override
  Future<void> logOut() async {
    await _googleSign.signOut();
  }
}
