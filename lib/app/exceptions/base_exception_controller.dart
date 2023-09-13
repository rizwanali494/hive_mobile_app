import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';

class BaseExceptionController {
  void handleException(error,
      {String? msg,
      BuildContext? context,
      List<Widget> actionButtons = const []}) {
    // if (error is TimeoutException) {}
    // if (error is HTTPStatusCodeException) {
    //   showErrorToast(msg: msg,context: context);
    // }
    showErrorToast(msg: msg, context: context);
  }

  void showErrorToast(
      {String? msg,
      BuildContext? context,
      List<Widget> actionButtons = const []}) {
    UtilFunctions.showToast(msg: msg, context: context);
  }
}
