import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/form_validator_extension.dart';
import 'package:hive_mobile/app/repositories/user_repository.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/email_verification/screens/mail_sent_screen.dart';

class EmailVerifyController extends ChangeNotifier with UtilFunctions {
  final emailCtrl = TextEditingController();

  void validate(BuildContext context) {
    final text = emailCtrl.text;
    final validate = form.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }
    verifyBackUpEmail(context);
  }

  GlobalKey<FormState> form = GlobalKey<FormState>();
  final emailValidator = ValidationBuilder().emailField().build();

  final apiService = GetIt.instance.get<ApiService>();

  Future<void> verifyBackUpEmail(BuildContext context) async {
    final text = emailCtrl.text.trim();
    final body = {
      "backup_email": text,
    };
    FocusManager.instance.primaryFocus?.unfocus();
    showLoaderDialog(context);
    try {
      final response =
          await userProfileService.updateBackupEmail(body: body, id: 0);
      context.pushReplacement(MailSentScreen.route, extra: {"email": text});
      return;
    } catch (e) {
      log("error verify email : ${e.toString()}");
    }
    context.pop();
  }

  late final userProfileService = UserRepository(apiService: apiService);
}
