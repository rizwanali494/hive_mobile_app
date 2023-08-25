import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/constants/file_upload_purpose.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/file_upload_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/university_application/repositories/university_application_repo.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class UniversityAppRequestVM extends ChangeNotifier {
  List<UniversityModel> universities = [];
  late UniversityApplicationRepository repository;
  ApiService apiService = GetIt.instance.get<ApiService>();
  UniversityApplicationModel? model;
  bool hasDocumentChanged = false;
  final scholarShipAmount = TextEditingController();
  final scholarShipPercent = TextEditingController();

  // final description = TextEditingController();

  UniversityAppRequestVM({required this.model}) {
    repository = UniversityApplicationRepoImpl(apiService: apiService);
    if (model == null) {
      getUniversities();
      return;
    }
    setModelValues();
  }

  UniversityModel? selectedUniversity;

  List<String> get allUniversities {
    return universities.map((item) => item.name ?? "").toList();
  }

  void selectUniversity(UniversityModel? value) {
    selectedUniversity = value;
    notifyListeners();
  }

  bool isGettingUniversities = true;
  bool hasError = false;

  Future<void> getUniversities() async {
    try {
      var list = await repository.getAllUniversities();
      universities = list;
      isGettingUniversities = false;
      notifyListeners();
      return;
    } catch (e) {
      hasError = true;
      if (e is HTTPStatusCodeException) {
        log(e.response.body);
        log(e.response.statusCode.toString());
      }
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    hasError = false;
    isGettingUniversities = true;
    notifyListeners();
    getUniversities();
  }

  String _selectedStatus = AppStrings.applied;

  void selectStatus(String value) {
    _selectedStatus = value;
    notifyListeners();
  }

  bool iSelected(String value) {
    return value == _selectedStatus;
  }

  File? documentFile;
  String? documentName;

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

  void validate(
      {required String scholarshipAmount, required String scholarshipPercent}) {
    if (scholarshipAmount.trim().isEmpty ||
        documentFile == null ||
        scholarshipPercent.trim().isEmpty) {
      log("empty");
      return;
    }
    uploadFile(
        scholarshipAmount: scholarshipAmount,
        scholarshipPercent: scholarshipPercent);
  }

  void uploadFile({
    required String scholarshipAmount,
    required String scholarshipPercent,
  }) async {
    try {
      var id = await getDocumentId();
      var documentId = await getDocumentId();
      var scholarshipAmountDigit = double.tryParse(scholarshipAmount) ?? 0;
      var scholarshipPercentDigit = double.tryParse(scholarshipPercent) ?? 0;
      var body = {
        "university": selectedUniversity?.id,
        // "description": description,
        "documents": [documentId],
        "scholarship_amount": scholarshipAmountDigit,
        "scholarship_percent": scholarshipPercentDigit,
        "state": _selectedStatus.toUpperCase(),
      };
      log(body.toString());
      await submitUniversityDocument(body);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log(e.response.statusCode.toString());
        log(e.response.body.toString());
      }
      log(e.toString());
    }
  }

  Future<void> submitUniversityDocument(Map<String, Object?> body) async {
    log("uni app body: ${body}");

    if (model == null) {
      await repository.uploadUniversityDocument(body: body);
    }
    await repository.updateUniversityDocument(body: body, id: model?.id ?? 0);
    // var newModel = UniversityApplicationModel(
    //   id: model?.id,
    //   localId: model?.localId??0,
    //   branchId: model?.branchId??0,
    //   cityId: model?.cityId??0,
    //   comments: model?.comments,
    //   dateAdded:  model?.comments,
    //   dateLastModified:  model?.dateLastModified,
    //   scholarshipAmount: model?.scholarshipAmount,
    //   scholarshipPercent: model?.scholarshipPercent,
    //   description: model?.description,
    //
    // );
  }

  Future<String> getDocumentId() async {
    if (model != null) {
      if (!hasDocumentChanged) {
        return model?.documents?.first.id ?? "";
      }
    }
    var fileModel =
        await repository.uploadUniversityDocumentFile(file: documentFile!);
    return fileModel.id ?? "";
  }

  void setModelValues() {
    if (model == null) {
      return;
    }
    scholarShipAmount.text = model!.scholarshipAmount ?? "";
    scholarShipPercent.text = model!.scholarshipPercent ?? "";
    setStatus();
    selectedUniversity = model?.university;
    // description.text = model?.description ?? "";
    isGettingUniversities = false;
    if (model?.documents?.isNotEmpty ?? false) {
      _downloadFile(model?.documents?.first.file ?? "",
          model?.documents?.first.label ?? "document");
    } else {
      log("file empty");
      fileDownloading = false;
      notifyListeners();
    }
  }

  void setStatus() {
    if (model?.state?.toUpperCase() == AppStrings.accepted.toUpperCase()) {
      _selectedStatus = AppStrings.accepted;
    }
    if (model?.state?.toUpperCase() == AppStrings.applied.toUpperCase()) {
      _selectedStatus = AppStrings.applied;
    }
    if (model?.state?.toUpperCase() == AppStrings.rejected.toUpperCase()) {
      _selectedStatus = AppStrings.rejected;
    }
  }

  String get title {
    if (model == null) {
      return AppStrings.selectUniversity;
    }
    return AppStrings.universityName;
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
}
