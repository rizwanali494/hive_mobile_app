import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/download_service/download_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view_models/base_document_controller.dart';
import 'package:hive_mobile/app/view_models/document_widget_controller.dart';
import 'package:hive_mobile/features/external_grading/subject_vm.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';
import 'package:collection/collection.dart';

class GradeDetailVM extends ChangeNotifier with DocumentController {
  final ExternalGradeModel model;
  late ExternalGradesRepo externalGradeRepo;

  GradeDetailVM({required this.model}) {
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    getAllSubjects(model.id ?? 0);
    getAllDocs();
  }

  String get degree => model.certificate ?? "";

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
      } on Exception catch (e) {
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
      if (e is HTTPStatusCodeException) {
        log("message: ${e.response.statusCode}");
        log("message: ${e.response.body}");
      }
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
      // TODO
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
      log("Error ${e.toString()}");
    }
  }
}
