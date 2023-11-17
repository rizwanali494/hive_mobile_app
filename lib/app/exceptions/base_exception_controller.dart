import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';

mixin BaseExceptionController {
  void handleException(error,
      {String? msg,
      BuildContext? context,
      List<Widget> actionButtons = const []}) {
    log("Error run time type : ${error.runtimeType}");
    if (error is TimeoutException) {
      showErrorToast(msg: "Request Timeout");
    }
    if (error is SocketException) {
      showErrorToast(msg: "No Internet Connection");
    }
    if (error is HTTPStatusCodeException) {
      _showApiErrorMessage(error.response.body);
      // showErrorToast(msg: msg, context: context);
    }
    // showErrorToast(msg: msg, context: context);
  }

  void showErrorToast(
      {String? msg,
      BuildContext? context,
      List<Widget> actionButtons = const []}) {
    UtilFunctions.showToast(msg: msg, context: context);
  }

  void _showApiErrorMessage(data) {
    final messageData = jsonDecode(data);
    String msg = messageData["message"] ?? AppStrings.somethingWentWrong;
    showErrorToast(msg: msg);
  }
}
