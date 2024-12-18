import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/form_validator_extension.dart';
import 'package:hive_mobile/app/mixin/event_bus_mixin.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/models/data/subject_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view_models/document_widget_controller.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';
import 'package:hive_mobile/features/external_grading/view_models/subject_vm.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

abstract class GradeAddingVM
    with UtilFunctions, ChangeNotifier, BaseExceptionController, EventBusMixin {
  final grades = ["A*", "A", "B", "C", "D", "E"];

  String? selectedGrade = "A*";

  bool isObjectLoading = true;
  bool hasObjectError = false;

  GradeAddingVM({List<String> certificates = const [], this.editModel}) {
    inItValues(certificates);
  }

  void inItValues(List<String> certificates);

  void setAvailableCertificates(List<String> list) {
    for (var element in list) {
      certificates.remove(element);
    }
  }

  String? selectedCertificate;
  final subjectCtrl = TextEditingController();
  final institute = TextEditingController();
  final gpa = TextEditingController();
  late ExternalGradesRepo externalGradeRepo;
  final apiService = GetIt.instance.get<ApiService>();

  List<String> certificates = [
    "O2",
    "O3",
    "AS",
    "A2",
  ];

  void setCertificate(List<String> deg) {
    for (var value in deg) {
      certificates.remove(value.toUpperCase());
    }
    selectedCertificate = this.certificates.asMap().containsKey(0)
        ? this.certificates.first
        : null;
  }

  void selectCertificate(String? value) {
    this.selectedCertificate = value;
    notifyListeners();
  }

  void setGrade(String? value) {
    this.selectedGrade = value;
    notifyListeners();
  }

  List<SubjectVM> subjectsVM = [];

  final scrollController = ScrollController();

  GlobalKey<FormState> subjectFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> gpaFormKey = GlobalKey<FormState>();

  String? subjectAddingValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Required";
    }
    bool alReadyAdded = subjectsVM.map((e) => e.name).toList().contains(value);
    if (alReadyAdded) {
      return "Already added";
    }
    return null;
  }

  Map<String, double> gradeLowerRange = {
    "A*": 4.3,
    "A": 4.1,
    "B": 3.1,
    "C": 2.1,
    "D": 1.1,
    "E": 0.5
  };
  Map<String, double> gradeUpperRange = {
    "A*": 5.0,
    "A": 4.2,
    "B": 4.0,
    "C": 3.0,
    "D": 2.0,
    "E": 1.0
  };

  String? gpaAddingValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Required";
    }
    final val = double.tryParse(value);
    if (val == null) {
      return "Invalid";
    }
    final upperRange = gradeUpperRange[selectedGrade ?? ""] ?? 0;
    final lowerRange = gradeLowerRange[selectedGrade ?? ""] ?? 0;

    if (val < lowerRange || val > upperRange) {
      UtilFunctions.showToast(
          msg:
              "The range for an ${selectedGrade ?? ""} GPA is $lowerRange to $upperRange.");
      return "Invalid Range select GPA\n in between $lowerRange to $upperRange.";
    }
    return null;
  }

  void addSubject() {
    bool validate = (subjectFormKey.currentState?.validate() ?? false) &&
        (gpaFormKey.currentState?.validate() ?? false);
    if (!validate) {
      return;
    }
    final subjectName = subjectCtrl.text.trim();
    final subjectGpa = gpa.text.trim();
    final gpaNumber = double.tryParse(subjectGpa) ?? 0.0;
    final hasSubject = subjectsVM
        .map((e) => e.name.toLowerCase())
        .toList()
        .contains(subjectName.toLowerCase());
    if (subjectName.isEmpty) {
      return;
    }
    if (!hasSubject) {
      final subject =
          SubjectVM(grade: selectedGrade!, name: subjectName, gpa: gpaNumber);
      subjectsVM.add(subject);
      subjectCtrl.clear();
      gpa.clear();
      notifyListeners();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final maxExtend = scrollController.position.maxScrollExtent;
        scrollController.jumpTo(maxExtend);
      });
    } else {
      UtilFunctions.showToast(msg: "Subject already added");
    }
  }

  List<int> removedSubjectIds = [];

  void removeSubject(SubjectVM subjectVM) {
    subjectsVM.remove(subjectVM);
    notifyListeners();
    if (editModel != null) {
      if (!subjectVM.isLocal) {
        removedSubjectIds.add(subjectVM.id ?? 0);
      }
    }
  }

  void updateVM(SubjectVM updateVM) {
    if (!updateVM.validate()) {
      return;
    }
    int indexOf = subjectsVM.indexOf(updateVM);
    log("index of $indexOf ${updateVM.id}");
    if (indexOf > -1) {
      subjectsVM[indexOf] = updateVM;
      notifyListeners();
    }
  }

  bool fileDownloading = false;

  bool validateData() {
    bool isDocumentEmpty = documents.isEmpty;
    bool isSubjectsEmpty = subjectsVM.isEmpty;
    bool isInstituteEmpty = institute.text.trim().isEmpty;
    bool formValidate = (form.currentState?.validate() ?? false);
    bool validate = isDocumentEmpty || isSubjectsEmpty || isInstituteEmpty;
    if (validate || !formValidate) {
      return false;
    }
    return true;
  }

  void addUpdate(BuildContext context) {
    if (!validateData()) {
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    if (editModel == null) {
      uploadExternalGrade(context);
      return;
    }
    updateExternalGrade(context);
  }

  Future<void> uploadExternalGrade(BuildContext context) async {
    showLoaderDialog(context);
    try {
      var resultFile = await uploadDocuments();
      var institutionName = institute.text.trim();
      var certificate = selectedCertificate ?? "";
      var body = {
        "institution_name": institutionName,
        "certificate": certificate,
        "result_files": resultFile?.map((e) => e.id).toList(),
      };
      var model = await externalGradeRepo.uploadExternalGrade(map: body);
      await uploadSubjects(model, subjectsVM);
      model = model.copyWith(resultFile: resultFile);
      context.pop();
      context.pop(model);
      UtilFunctions.showToast(msg: AppStrings.externalGradeUploaded);
      return;
    } catch (error) {
      log(error.toString());
      handleException(error);
    }
    context.pop();
  }

  Future<List<SubjectModel>> uploadSubjects(
      ExternalGradeModel model, List<SubjectVM> list) async {
    var subjectNames = list.map((e) => e.name).toList();
    var subjectGrades = list.map((e) => e.grade).toList();
    var subjectGPAs = list.map((e) => e.gpa).toList();
    List<Map> bodies = [];
    bodies = List.generate(
      list.length,
      (index) => {
        "name": "${subjectNames[index]}",
        "grade": "${subjectGrades[index]}",
        "external_grade": "${model.id}",
        "gpa": subjectGPAs[index]
      },
    );
    var subjects = await Future.wait(
      [
        for (int i = 0; i < list.length; i++)
          externalGradeRepo.uploadSubject(map: bodies[i])
      ],
    );
    return subjects;
  }

  Future<void> updateExternalGrade(BuildContext context) async {
    if (editModel == null) {
      return;
    }
    log("updating external gradeasdasd");
    showLoaderDialog(context);
    try {
      var file = await getUpdatedDocuments();
      await updateSubjects();
      log("File ::::::::::: 222");
      var institutionName = institute.text.trim();
      var certificate = selectedCertificate ?? "";
      var body = {
        "institution_name": institutionName,
        "certificate": certificate,
        "result_files": file?.map((e) => e.id).toList(),
      };
      log("body :: ${body}");
      var model = await externalGradeRepo.updateExternalGrade(
          map: body, id: editModel?.id ?? 0);
      model = model.copyWith(
          resultFile: file,
          certificate: certificate,
          institutionName: institutionName);
      log("file model : ${model}");
      log("file : ${model.resultFile.toString()}");
      context.pop();
      context.pop(model);
      publishEvent<ExternalGradeModel>(data: model);
      UtilFunctions.showToast(
          msg: AppStrings.externalGradeUpdated, context: context);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
        log("${e.response.body}");
      }
      handleException(e);
      log("error in external grade : ${e.toString()}");
      // UtilFunctions.showToast(
      //     msg: AppStrings.somethingWentWrong, context: context);
    }
    context.pop();
  }

  Future<void> updateSubjects() async {
    var localList = subjectsVM.where((element) => element.isLocal).toList();
    var list = subjectsVM.where((element) => !element.isLocal).toList();
    var ids = list.map((e) => e.id).toList();
    log(ids.toString());
    List<Map> bodies = [];
    bodies = List.generate(
      ids.length,
      (index) => {
        "name": "${list[index].name}",
        "grade": "${list[index].grade}",
      },
    );
    await Future.wait(
      [
        for (int i = 0; i < ids.length; i++)
          externalGradeRepo.updateSubject(map: bodies[i], id: ids[i] ?? 0),
        uploadSubjects(editModel!, localList)
      ],
    );
  }

  ExternalGradeModel? editModel;

  void setValues(ExternalGradeModel model) {
    var certificate =
        certificates.where((element) => element == model.certificate).toList();
    if (certificate.isNotEmpty) {
      selectedCertificate = certificate.first;
    }
    institute.text = model.institutionName ?? "";
    downloadAllDocs();
    getAllSubjects(model.id ?? 0);
    editModel = model;
  }

  bool gettingSubjects = true;

  Future<void> getAllSubjects(int id) async {
    gettingSubjects = true;
    try {
      var list = await externalGradeRepo.getAllSubjects(id: id);
      subjectsVM = List.generate(
        list.length,
        (index) => SubjectVM(
            name: list[index].name ?? "",
            grade: list[index].grade ?? '',
            gpa: list[index].gpa ?? 0.0,
            isLocal: false,
            id: list[index].id),
      );
    } catch (e) {
      handleException(e);
    }
    gettingSubjects = false;
    notifyListeners();
  }

  Future<void> deleteAllSubjects(List<int> ids) async {
    await Future.wait([
      for (var element in ids) externalGradeRepo.deleteSubject(id: element)
    ]);
    return;
  }

  /// todo batch file
  List<DocumentWidgetController> documents = [];

  Future<void> selectDocuments(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final docs =
        await UtilFunctions.openImageTypeDialog(context, imageCount: 8);
    log("docs : ${docs?.length}");
    if (docs != null) {
      for (final doc in docs) {
        final fileName = basename(doc.path);
        DocumentWidgetController controller = DocumentWidgetController(
            onRemove: (String? id) {
              log("message : ${id}");
              documents.removeWhere((element) => element.id == id);
              notifyListeners();
            },
            file: doc,
            documentName: fileName);
        documents.add(controller);
      }
    }
    notifyListeners();
  }

  bool errorDownloading = false;

  Future<void> downloadAllDocs() async {
    fileDownloading = true;
    errorDownloading = false;
    notifyListeners();
    try {
      final files = await Future.wait([
        for (final element in this.editModel?.resultFile ?? <Attachments>[])
          downloadDoc(
              fileName: element.label ?? "",
              url: element.file ?? "",
              fileId: element.id),
      ]);
      for (var value in files) {
        if (value != null) {
          documents.add(value);
        }
      }
    } catch (error) {
      errorDownloading = true;
      handleException(error);
      notifyListeners();
    }
    fileDownloading = false;
    notifyListeners();
  }

  Future<DocumentWidgetController?> downloadDoc(
      {required String fileName,
      required String url,
      required String? fileId}) async {
    final file = await _downloadFile(url, fileName);
    if (file == null) {
      return null;
    }
    final controller = DocumentWidgetController(
        documentName: fileName,
        fileId: fileId,
        file: file,
        downloaded: true,
        onRemove: (id) {
          documents.removeWhere((element) => element.id == id);
          notifyListeners();
        });
    return controller;
  }

  Future<File?> _downloadFile(String url, String filename) async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url)).timeout(
          Duration(minutes: 2),
        );
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    final dir = await getTemporaryDirectory();
    File file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<List<Attachments>?> getUpdatedDocuments() async {
    List<Attachments> list = [];
    final downloadedIds = documents.map((e) => e.fileId).toList();
    list.addAll(editModel?.resultFile
            ?.where((element) => downloadedIds.contains(element.id))
            .toList() ??
        []);
    final toDownload =
        documents.where((element) => !element.downloaded).toList();
    var files = await externalGradeRepo.uploadResultFile(
        files: toDownload.map((e) => e.file).toList());
    list.addAll([...?files]);
    return list;
  }

  Future<List<Attachments>?> uploadDocuments() async {
    var fileModel = await externalGradeRepo.uploadResultFile(
        files: documents.map((e) => e.file).toList());
    return fileModel;
  }

  bool get isMaxed {
    return documents.length > 8;
  }

  Future<void> retry() async {
    downloadAllDocs();
    getAllSubjects(editModel?.id ?? 0);
  }

  GlobalKey<FormState> form = GlobalKey<FormState>();
  final instituteValidator = ValidationBuilder().requiredField().build();
}
