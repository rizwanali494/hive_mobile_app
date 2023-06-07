import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/services/auth/auth_service.dart';
import 'package:hive_mobile/services/auth/google_auth_service.dart';

class AuthVM extends ChangeNotifier {
  Future googleSignIn() async {
    AuthService authService = GoogleAuthService();
    await authService.logOut();
    String? user = await authService.logIn();
  }
}
