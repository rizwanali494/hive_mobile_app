import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/form_validator_extension.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/my_services/repositories/new_service_request_repo.dart';

class ServiceRequestVM extends ChangeNotifier
    with UtilFunctions, BaseExceptionController {
  bool _isChangeRequest = false;
  late NewServiceRequestRepo newServiceRequestRepo;

  ServiceRequestVM() {
    newServiceRequestRepo = NewServiceRequestRepo(apiService: apiService);
  }

  bool get isChangeRequest => _isChangeRequest;

  void toggleChangeRequest() {
    _isChangeRequest = !_isChangeRequest;
    notifyListeners();
  }

  final requestName = ValidationBuilder().requiredField().build();
  final requestDescription = ValidationBuilder().requiredField().build();

  void validate(String title, String description, BuildContext context) {
    if (!(form.currentState?.validate() ?? false)) {
      return;
    }
    sendNewRequest(title, description, context);
  }

  final apiService = GetIt.instance.get<ApiService>();

  Future<void> sendNewRequest(
      String title, String description, BuildContext context) async {
    var body = {
      "name": title,
      "description": description,
      "is_subject_teacher_change_request": _isChangeRequest
    };
    showLoaderDialog(context);
    try {
      await newServiceRequestRepo.requestNewService(body: body);
      context.pop();
      context.pop(true);
      return;
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log(e.response.body.toString());
        log(e.response.statusCode.toString());
      }
      // UtilFunctions.showToast(msg: AppStrings.somethingWentWrong);
      handleException(e);
      log(e.toString());
    }
    context.pop();
  }

  GlobalKey<FormState> form = GlobalKey<FormState>();
}
