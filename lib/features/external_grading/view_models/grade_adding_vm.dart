import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/models/data/subject_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';
import 'package:hive_mobile/features/external_grading/subject_vm.dart';
import 'package:path_provider/path_provider.dart';

class GradeAddingVM extends ChangeNotifier with UtilFunctions {
  final grades = [
    "A",
    "B+",
    "B",
    "C+",
    "C",
  ];
  String? selectedGrade = "A";

  GradeAddingVM({List<String> degrees = const [], this.editModel}) {
    setDegrees(degrees);
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    if (editModel != null) {
      setValues(editModel!);
    }
  }

  String? selectedDegree;
  final subjectCtrl = TextEditingController();
  final institute = TextEditingController();
  late ExternalGradesRepo externalGradeRepo;
  final apiService = GetIt.instance.get<ApiService>();

  List<String> degrees = [
    "O2",
    "O3",
    "AS1",
    "AS2",
  ];

  void setDegrees(List<String> deg) {
    for (var value in deg) {
      degrees.remove(value.toUpperCase());
    }
    selectedDegree =
        this.degrees.asMap().containsKey(0) ? this.degrees.first : null;
  }

  void selectDegree(String? value) {
    this.selectedDegree = value;
    notifyListeners();
  }

  void setGrade(String? value) {
    this.selectedGrade = value;
    notifyListeners();
  }

  List<SubjectVM> subjectsVM = [];

  void addSubject() {
    final subjectName = subjectCtrl.text.trim();
    final hasSubject = subjectsVM
        .map((e) => e.name.toLowerCase())
        .toList()
        .contains(subjectName.toLowerCase());
    if (subjectName.isEmpty) {
      return;
    }
    if (!hasSubject) {
      final subject = SubjectVM(grade: selectedGrade!, name: subjectName);
      subjectsVM.add(subject);
    }
    subjectCtrl.clear();
    notifyListeners();
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
    int indexOf = subjectsVM.indexOf(updateVM);
    log("index of $indexOf ${updateVM.id}");
    if (indexOf > -1) {
      subjectsVM[indexOf] = updateVM;
      notifyListeners();
    }
  }

  File? documentFile;
  String? documentName;
  bool hasDocumentChanged = false;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: ["pdf"], type: FileType.custom);
    if (result != null) {
      hasDocumentChanged = true;
      bool validFile = true;
      if (validFile) {
        documentName = result.files.single.name;
        documentFile = File(result.files.single.path!);
        notifyListeners();
      }
    } else {}
  }

  void removeFile() async {
    documentFile = null;
    documentName = null;
    notifyListeners();
  }

  bool fileDownloading = false;

  Future<void> _downloadFile(String url, String filename) async {
    fileDownloading = true;
    notifyListeners();
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      final dir = await getTemporaryDirectory();
      File file = File('${dir.path}/$filename');
      await file.writeAsBytes(bytes);
      this.documentFile = file;
      documentName = filename;
    } catch (error) {
      print('pdf downloading error = $error');
    }
    fileDownloading = false;
    notifyListeners();
  }

  bool validateData() {
    bool isDocumentEmpty = documentFile == null;
    bool isSubjectsEmpty = subjectsVM.isEmpty;
    bool isInstituteEmpty = institute.text.trim().isEmpty;
    bool validate = isDocumentEmpty || isSubjectsEmpty || isInstituteEmpty;
    if (validate) {
      return false;
    }
    return true;
  }

  void addUpdate(BuildContext context) {
    if (!validateData()) {
      return;
    }
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
      log("message : ${resultFile?.id}");
      var institutionName = institute.text.trim();
      var degree = selectedDegree ?? "";
      var body = {
        "institution_name": institutionName,
        "degree": degree,
        "result_file": resultFile?.id,
      };
      var model = await externalGradeRepo.uploadExternalGrade(map: body);
      log("popped 1");
      var subjects = await uploadSubjects(model, subjectsVM);
      log("popped 2");
      model.copyWith(resultFile: resultFile);
      context.pop();
      context.pop();
      return;
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
        log("${e.response.body}");
      }
      log(e.toString());
    }
    context.pop();
  }

  Future<List<SubjectModel>> uploadSubjects(
      ExternalGradeModel model, List<SubjectVM> list) async {
    var subjectNames = list.map((e) => e.name).toList();
    var subjectGrades = list.map((e) => e.grade).toList();
    List<Map> bodies = [];
    bodies = List.generate(
      list.length,
      (index) => {
        "name": "${subjectNames[index]}",
        "grade": "${subjectGrades[index]}",
        "external_grade": "${model.id}",
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
    showLoaderDialog(context);
    try {
      var file = editModel!.resultFile;
      if (hasDocumentChanged) {
        file = await uploadDocuments();
      }
      await updateSubjects();
      var institutionName = institute.text.trim();
      var degree = selectedDegree ?? "";
      var body = {
        "institution_name": institutionName,
        "degree": degree,
        "result_file": file?.id,
      };
      var model = await externalGradeRepo.updateExternalGrade(
          map: body, id: editModel?.id ?? 0);
      model.copyWith(
          resultFile: file, degree: degree, institutionName: institutionName);
      context.pop();
      context.pop(model);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
        log("${e.response.body}");
      }
    }
    context.pop();
  }

  Future<void> updateSubjects() async {
    var localList = subjectsVM.where((element) => element.isLocal).toList();
    // await uploadSubjects(editModel!, localList);
    var list = subjectsVM.where((element) => !element.isLocal).toList();
    var ids = list.map((e) => e.id).toList();
    List<Map> bodies = [];
    bodies = List.generate(
      ids.length,
      (index) => {
        "name": "${list[index]}",
        "grade": "${list[index]}",
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

  Future<Attachments?> uploadDocuments() async {
    var fileModel =
        await externalGradeRepo.uploadResultFile(file: documentFile!);
    return fileModel;
  }

  ExternalGradeModel? editModel;

  void setValues(ExternalGradeModel model) {
    var degree = degrees.where((element) => element == model.degree).toList();
    if (degree.isNotEmpty) {
      selectedDegree = degree.first;
    }
    institute.text = model.institutionName ?? "";
    _downloadFile(model.resultFile?.file ?? "", model.resultFile?.label ?? "");
    getAllSubjects(model.id ?? 0);
  }

  bool gettingSubjects = true;

  Future<void> getAllSubjects(int id) async {
    var list = await externalGradeRepo.getAllSubjects(id: id);
    subjectsVM = List.generate(
      list.length,
      (index) => SubjectVM(
          name: list[index].name ?? "",
          grade: list[index].grade ?? '',
          isLocal: false,
          id: list[index].id),
    );
  }

  Future<void> deleteAllSubjects(List<int> ids) async {
    await Future.wait([
      for (var element in ids) externalGradeRepo.deleteSubject(id: element)
    ]);
    return;
  }


}
