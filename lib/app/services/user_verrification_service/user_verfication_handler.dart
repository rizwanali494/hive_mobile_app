import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/features/email_verification/screens/email_verification_screen.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';

class UserVerificationHandler {

  void checkEmailVerification(BuildContext context,UserModel model) {
    log("message ::: ${model.accountData?.isBackUpEmailVerified}");
    if ((model.accountData?.isBackUpEmailVerified ?? false)) {
      context.pushReplacement(HomeScreen.route);
      return;
    }
    context.pushReplacement(EmailVerificationScreen.route);
  }
}
