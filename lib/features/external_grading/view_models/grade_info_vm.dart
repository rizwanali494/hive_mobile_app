import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/external_grading/subject_vm.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';

class GradeDetailVM extends ChangeNotifier {
  final ExternalGradeModel model;
  late ExternalGradesRepo externalGradeRepo;

  GradeDetailVM({required this.model}) {
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    getAllSubjects(model.id ?? 0);
  }

  String get degree => model.degree ?? "";

  String get subject => model.subjects?.first.name ?? "";

  String get institute => model.institutionName ?? "";

  String get grade => model.subjects?.first.grade ?? "";

  String get documentName => model.resultFile?.label ?? "";

  final apiService = GetIt.instance.get<ApiService>();
  List<SubjectVM> subjectsVM = [];

  bool gettingSubject = true;

  Future<void> getAllSubjects(int id) async {
    try {
      var list = await externalGradeRepo.getAllSubjects(id: id);
      subjectsVM = List.generate(
        list.length,
        (index) => SubjectVM(
          name: list[index].name ?? "",
          grade: list[index].grade ?? '',
          isLocal: false,
          id: list[index].id,
        ),
      );
    } catch (e) {
      // TODO
    }
    gettingSubject = false;
    notifyListeners();
  }

  void updateVM(SubjectVM updateVM) {
    int indexOf = subjectsVM.indexOf(updateVM);
    log("index of $indexOf ${updateVM.id}");
    if (indexOf > -1) {
      subjectsVM[indexOf] = updateVM;
      notifyListeners();
    }
  }

  void removeSubject(SubjectVM subjectVM) {
    subjectsVM.remove(subjectVM);
    notifyListeners();
  }
}
