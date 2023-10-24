import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/form_validator_extension.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';

class EmailVerifyController extends ChangeNotifier with UtilFunctions {
  final emailCtrl = TextEditingController();

  void validate() {
    final text = emailCtrl.text;
    final validate = form.currentState?.validate() ?? false;
    if (!validate) {
      return;
    }
  }

  GlobalKey<FormState> form = GlobalKey<FormState>();
  final emailValidator =
  ValidationBuilder().emailField().build();

  final apiService = GetIt.instance.get<ApiService>();

  Future<void> verifyBackUpEmail(BuildContext context) async {
    final text = emailCtrl.text.trim();
    final url = ApiEndpoints.verifyEmail;
    final body = {
      "backup_email": text,
    };
    FocusManager.instance.primaryFocus?.unfocus();
    showLoaderDialog(context);
    try {
      final response = await apiService.post(url: url, body: body);
      return;
    } catch (e) {
      log("error verify email : ${e.toString()}");
    }
    context.pop();
  }
}
