import 'dart:developer';

import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_adding_vm.dart';

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
