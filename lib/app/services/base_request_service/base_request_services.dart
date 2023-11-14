import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';

Future<void> performRequest(
    {required Future Function() request, Function()? onError}) async {
  try {
    await request.call();
  } catch (error) {
    if (onError != null) {
      onError.call();
    } else {
      BaseExceptionController().handleException(error);
    }
  }
}