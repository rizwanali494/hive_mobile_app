import 'dart:developer';
import 'dart:math' hide log;

import 'package:hive_mobile/app/models/user_auth_model.dart';
import 'package:hive_mobile/app/services/auth_services/auth_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthService implements AuthService {
  @override
  Future<UserAuthModel?> logIn() async {
    try {
      final validCreds = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final email = validCreds.email;
      return UserAuthModel(email: email);
    } catch (e) {
      log("Something went wrong ${e.toString()}");
    }
    return null;
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  String getNonce({int length = 32}) {
    String _allValues = ("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz");
    String finalString = "";
    Random rand = Random.secure();
    for (int i = 0; i < length; i++) {
      finalString += _allValues[rand.nextInt(_allValues.length - 1)];
    }
    return finalString;
  }
}
