import 'dart:developer';
import 'dart:io';
import 'package:form_validator/form_validator.dart';
import 'package:hive_mobile/app/extensions/form_validator_extension.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_adding_vm.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/models/data/subject_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view_models/document_widget_controller.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';
import 'package:hive_mobile/features/external_grading/view_models/subject_vm.dart';
import 'package:path_provider/path_provider.dart';

class GradeAddingIdVM extends GradeAddingVM {
  final grades = ["A*", "A", "B", "C", "D", "E"];

  String? selectedGrade = "A*";

  final int objectId;

  GradeAddingIdVM(
      {List<String> certificates = const [], required this.objectId}) {
    // setCertificate(certificates);
    // externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    // if (editModel != null) {
    //   setValues(editModel!);
    // }
  }

  Future<ExternalGradeModel> getExternalGrade() async {
    isObjectLoading = true;
    notifyListeners();
    final model = await externalGradeRepo.getExternalGrade(objectId);
    return model;
  }

  @override
  void inItValues(List<String> certificates) async {
    try {
      externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
      final model = await getExternalGrade();
      editModel = model;
      setValues(editModel!);
    } catch (e) {
      log("Unable to fetch external grade :: ${e.toString()}");
      hasObjectError = true;
    }
    isObjectLoading = false;
    notifyListeners();
    // setCertificate(certificates);
    // externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    // if (editModel != null) {
    //   isObjectLoading = false;
    //   setValues(editModel!);
    // }
  }

}
