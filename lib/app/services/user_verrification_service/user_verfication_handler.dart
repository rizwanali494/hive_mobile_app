import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/features/email_verification/screens/email_verification_screen.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';

class UserVerificationHandler {
  final userModel = GetIt.instance.get<UserModel>();

  void checkEmailVerification(BuildContext context) {
    if (userModel.isEmailVerified ?? false) {
      context.pushReplacement(HomeScreen.route);
      return;
    }
    context.pushReplacement(EmailVerificationScreen.route);
  }
}
