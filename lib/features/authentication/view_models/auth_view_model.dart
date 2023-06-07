import 'package:flutter/material.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:hive_mobile/services/auth/auth_service.dart';
import 'package:hive_mobile/services/auth/google_auth_service.dart';

class AuthVM extends ChangeNotifier {
  Future googleSignIn(BuildContext context) async {
    AuthService authService = GoogleAuthService();
    await authService.logOut();
    String? user = await authService.logIn();
    if (context.mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    }
  }
}
