import 'dart:async';

import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';

class BaseExceptionController {
  void handleException(error) {
    if (error is TimeoutException) {}
    if (error is HTTPStatusCodeException) {}
  }
}
