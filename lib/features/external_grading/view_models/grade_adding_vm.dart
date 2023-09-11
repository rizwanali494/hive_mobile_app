import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/external_grading/screens/external_grade_repository.dart';
import 'package:hive_mobile/features/external_grading/subject_vm.dart';
import 'package:path_provider/path_provider.dart';

class GradeAddingVM extends ChangeNotifier {
  final grades = [
    "A",
    "B+",
    "B",
    "C+",
    "C",
  ];
  String? selectedGrade = "A";

  GradeAddingVM({List<String> degrees = const []}) {
    setDegrees(degrees);
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
  }

  String? selectedDegree;
  final subjectCtrl = TextEditingController();
  final institute = TextEditingController();
  late ExternalGradesRepo externalGradeRepo;
  final apiService = GetIt.instance.get<ApiService>();

  List<String> degrees = [
    "A1",
    "A2",
    "O1",
    "O2",
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

  void deleteSubject(SubjectVM subjectVM) {
    subjectsVM.remove(subjectVM);
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

  Future<void> uploadExternalGrade() async {
    if (!validateData()) {
      return;
    }
    var resultFile = await uploadDocuments();
    log("message : ${resultFile?.first.id}");
    var institutionName = institute.text.trim();
    var degree = selectedDegree ?? "";
    var body = {
      "institution_name": institute,
      "degree": degree,
      "result_file": resultFile?.map((e) => e.id ?? "").toList(),
    };
  }

  Future<List<Attachments>?> uploadDocuments() async {
    var fileModel =
        await externalGradeRepo.uploadResultFile(file: documentFile!);
    return [fileModel];
  }
}
