import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/services/auth_service.dart';
import 'package:hive_mobile/app/services/google_auth_service.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';

class AuthVM extends ChangeNotifier {
  Future googleSignIn(BuildContext context) async {
    AuthService authService = GoogleAuthService();
    // await authService.logOut();
    if( kDebugMode || kProfileMode ){
      context.pushReplacement(HomeScreen.route);
      return;
    }
    var user = await authService.logIn();
    if ((context.mounted && user != null)) {
      context.pushReplacement(HomeScreen.route);
    }
  }
}
