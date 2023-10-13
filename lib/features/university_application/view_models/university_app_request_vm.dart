import 'dart:developer';
import 'dart:io';
import 'package:hive_mobile/app/view_models/document_widget_controller.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/university_application/repositories/university_application_repo.dart';
import 'package:path_provider/path_provider.dart';

class UniversityAppRequestVM extends ChangeNotifier with UtilFunctions {
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

  // void removeFile() async {
  //   documentName = null;
  //   notifyListeners();
  // }

  bool validate() {
    final scholarshipAmount = scholarShipAmount.text.trim();
    final scholarshipPercent = scholarShipPercent.text.trim();
    if (scholarshipAmount.trim().isEmpty ||
        documents.isEmpty ||
        scholarshipPercent.trim().isEmpty) {
      log("empty");
      return false;
    }
    return true;
    // uploadFile(
    //     scholarshipAmount: scholarshipAmount,
    //     scholarshipPercent: scholarshipPercent,
    //     context: context);
  }

  void uploadFile({required BuildContext context}) async {
    final scholarshipAmount = scholarShipAmount.text.trim();
    final scholarshipPercent = scholarShipPercent.text.trim();
    if (!validate()) {
      return;
    }
    showLoaderDialog(context);
    try {
      var documents = await uploadDocuments();
      var scholarshipAmountDigit = double.tryParse(scholarshipAmount) ?? 0;
      var scholarshipPercentDigit = double.tryParse(scholarshipPercent) ?? 0;
      var body = {
        "university": selectedUniversity?.id,
        "documents": documents?.map((e) => e.id).toList(),
        "description": "Lorem Porum",
        "scholarship_amount": scholarshipAmountDigit,
        "scholarship_percent": scholarshipPercentDigit,
        "state": "APPLIED",
      };
      UniversityApplicationModel? updatedModel;
      if (model == null) {
        log(body.toString());
        var createdModel =
        await repository.uploadUniversityDocument(body: body);
        updatedModel = createdModel.copyWith(
          documents: documents,
          university: selectedUniversity,
        );
        UtilFunctions.showToast(msg: "Upload Successful");
      } else {
        updatedModel = await updateUniversityDocument(
            scholarshipAmount: scholarshipAmount,
            scholarshipPercent: scholarshipPercent);
        UtilFunctions.showToast(msg: "Update Successful");
      }
      context.pop();
      context.pop(updatedModel);
    } catch (e) {
      context.pop();
      if (e is HTTPStatusCodeException) {
        log(e.response.statusCode.toString());
        log(e.response.body.toString());
      }
      log(e.toString());
    }
  }

  Future<UniversityApplicationModel?> updateUniversityDocument(
      {required String scholarshipAmount,
      required String scholarshipPercent}) async {
    var documents = await getUpdatedDocuments();
    var scholarshipAmountDigit = double.tryParse(scholarshipAmount) ?? 0;
    var scholarshipPercentDigit = double.tryParse(scholarshipPercent) ?? 0;
    var body = {
      "university": selectedUniversity?.id,
      "documents": documents?.map((e) => e.id).toList(),
      "scholarship_amount": scholarshipAmountDigit,
      "scholarship_percent": scholarshipPercentDigit,
      "state": _selectedStatus.toUpperCase(),
    };
    await repository.updateUniversityDocument(body: body, id: model?.id ?? 0);
    var updatedModel = model?.copyWith(
      university: selectedUniversity,
      documents: documents,
      scholarshipAmount: scholarshipAmountDigit.toString(),
      scholarshipPercent: scholarshipPercentDigit.toString(),
      state: _selectedStatus.toUpperCase(),
    );
    return updatedModel;
  }

  Future<List<Attachments>?> getUpdatedDocuments() async {
    List<Attachments> list = [];
    final downloadedIds = documents.map((e) => e.fileId).toList();
    list.addAll(model?.documents
            ?.where((element) => downloadedIds.contains(element.id))
            .toList() ??
        []);
    final toDownload =
        documents.where((element) => !element.downloaded).toList();
    log("toUpload : ${toDownload.length}");
    var files = await repository.uploadUniversityDocumentFile(
        files: toDownload.map((e) => e.file).toList());
    list.addAll(files);
    return list;
  }

  Future<List<Attachments>?> uploadDocuments() async {
    var fileModel = await repository.uploadUniversityDocumentFile(
        files: documents.map((e) => e.file).toList());
    return fileModel;
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
      downloadAllDocs();
      // _downloadFile(model?.documents?.first.file ?? "",
      //     model?.documents?.first.label ?? "document");
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

  Future<File?> _downloadFile(String url, String filename) async {
    log("downloading: $filename");
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    final dir = await getTemporaryDirectory();
    File file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  List<DocumentWidgetController> documents = [];

  Future<void> selectDocuments(BuildContext context) async {
    final docs =
        await UtilFunctions.openImageTypeDialog(context, imageCount: 8);
    if (docs != null) {
      for (final doc in docs) {
        final fileName = basename(doc.path);
        DocumentWidgetController controller = DocumentWidgetController(
            onRemove: (String? id) {
              documents.removeWhere((element) => element.id == id);
              notifyListeners();
            },
            file: doc,
            documentName: fileName);
        documents.add(controller);
      }
      hasDocumentChanged = true;
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
        for (final element in this.model?.documents ?? <Attachments>[])
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
    } catch (e) {
      errorDownloading = true;
      log("error ${e.toString()}");
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

  bool get isMaxed {
    return documents.length > 8;
  }
}
