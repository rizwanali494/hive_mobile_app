import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/download_service/download_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view_models/base_document_controller.dart';
import 'package:hive_mobile/app/view_models/document_widget_controller.dart';
import 'package:hive_mobile/features/external_grading/view_models/subject_vm.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';

class GradeDetailVM extends ChangeNotifier
    with DocumentController, BaseExceptionController {
  final ExternalGradeModel model;
  late ExternalGradesRepo externalGradeRepo;

  GradeDetailVM({required this.model}) {
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    getAllSubjects(model.id ?? 0);
    getAllDocs();
  }

  String get certificate => model.certificate ?? "";

  String get subject => model.subjects?.first.name ?? "";

  String get institute => model.institutionName ?? "";

  String get grade => model.subjects?.first.grade ?? "";

  String get documentName => "";

  final apiService = GetIt.instance.get<ApiService>();
  List<SubjectVM> subjectsVM = [];

  bool gettingSubject = true;
  bool errorDownloading = false;

  void updateVM(SubjectVM updateVM) {
    int indexOf = subjectsVM.indexOf(updateVM);
    log("index ofaaa $indexOf ${updateVM.id}");
    if (indexOf > -1) {
      subjectsVM[indexOf] = updateVM;
      notifyListeners();
      try {
        externalGradeRepo.updateSubject(id: updateVM.id ?? 0, map: {
          "name": updateVM.name,
          "grade": updateVM.grade,
        }).then((value) {
          log("updated  ");
        });
      } catch (e) {
        handleException(e);
        log("message ${e.toString()}");
      }
      notifyListeners();
    }
  }

  void removeSubject(SubjectVM subjectVM) {
    subjectsVM.remove(subjectVM);
    notifyListeners();
    try {
      externalGradeRepo.deleteSubject(id: subjectVM.id ?? 0);
    } catch (e) {
      handleException(e);
      subjectsVM.add(subjectVM);
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    getAllDocs();
    getAllSubjects(model.id ?? 0);
  }

  List<DocumentWidgetController> documents = [];

  bool downloadingDocs = true;

  Future<void> getAllSubjects(int id) async {
    gettingSubject = true;
    errorDownloading = false;
    notifyListeners();
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
      handleException(e);
      errorDownloading = true;
    }
    gettingSubject = false;
    notifyListeners();
  }

  Future<void> getAllDocs() async {
    errorDownloading = false;
    downloadingDocs = true;
    notifyListeners();
    try {
      documents = await downloadAllDocs(docs: model.resultFile);
    } catch (e) {
      errorDownloading = true;
      // handleException(e);
    }
    downloadingDocs = false;
    notifyListeners();
  }

  bool get isDownloading => downloadingDocs || gettingSubject;

  final downloadService = GetIt.instance.get<DownloadService>();

  Future<void> downloadAllDocuments() async {
    try {
      for (var element in documents) {
        downloadService.downloadFile(
            fileUrl: element.url ?? "", name: element.documentName);
      }
      UtilFunctions.showToast(
          msg:
              "Download Started. Please visit Notifications system for status.");
    } catch (e) {
      handleException(e);
      log("Error ${e.toString()}");
    }
  }
}
