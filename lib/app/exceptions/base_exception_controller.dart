import 'dart:async';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';

class BaseExceptionController {
  void handleException(error, {String? msg}) {
    if (error is TimeoutException) {}
    if (error is HTTPStatusCodeException) {
      showToast(msg: msg);
    }
  }

  void showErrorToast() {
    showToast();
  }

  showToast({String? msg}) {
    UtilFunctions.showToast(msg: msg);
  }
}
