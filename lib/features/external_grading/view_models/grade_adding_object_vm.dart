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

class GradeAddingObjectVM extends GradeAddingVM {
  final grades = ["A*", "A", "B", "C", "D", "E"];

  String? selectedGrade = "A*";

  GradeAddingObjectVM(
      {List<String> certificates = const [], ExternalGradeModel? model})
      : super(editModel: model) {
    setCertificate(certificates);
  }

  @override
  void inItValues(List<String> certificates) {
    // setCertificate(certificates);
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    if (editModel != null) {
      isObjectLoading = false;
      setValues(editModel!);
    } else {
      isObjectLoading = false;
      notifyListeners();
    }
  }

}
