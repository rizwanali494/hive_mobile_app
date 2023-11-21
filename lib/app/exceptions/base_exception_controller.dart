import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/exceptions/refresh_token_exception.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';

mixin BaseExceptionController {
  void handleException(error,
      {String? msg,
      BuildContext? context,
      List<Widget> actionButtons = const []}) {
    log("Type of error found : ${error.runtimeType}");
    if (error is TimeoutException) {
      showErrorToast(msg: "Request Timeout");
    } else if (error is SocketException) {
      showErrorToast(msg: "No Internet Connection");
    } else if (error is HTTPStatusCodeException) {
      _showResponseMessage(error.response.body);
      log("Error : ${error.response.body}");
      // showErrorToast(msg: msg, context: context);
    } else if (!(error is RefreshTokenException)) {
      showErrorToast();
    }
    // showErrorToast(msg: msg, context: context);
  }

  void showErrorToast(
      {String? msg,
      BuildContext? context,
      List<Widget> actionButtons = const []}) {
    UtilFunctions.showToast(msg: msg, context: context);
  }

  void _showResponseMessage(data) {
    final messageData = jsonDecode(data);
    String msg = messageData["message"] ?? AppStrings.somethingWentWrong;
    showErrorToast(msg: msg);
  }
}
