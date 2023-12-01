import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/constants/file_upload_purpose.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class UniversityApplicationRepository {
  late ApiService apiService;

  UniversityApplicationRepository({required this.apiService});

  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet});

  Future<UniversityApplicationModel> getUniversityApplication(
      {required int id});

  Future<List<UniversityApplicationModel>> getPreviousApplications(
      {int? limit, int? offSet});

  Future<List<UniversityModel>> getAllUniversities();

  Future<List<Attachments>> uploadUniversityDocumentFile(
      {required List<File> files});

  Future<UniversityApplicationModel> uploadUniversityDocument(
      {required Map body});

  Future<UniversityApplicationModel> updateUniversityDocument(
      {required Map body, required int id});
}

class UniversityApplicationRepoImpl extends UniversityApplicationRepository {
  UniversityApplicationRepoImpl({required super.apiService});

  @override
  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet}) async {
    var url = apiEndpoint(offSet, limit).withApprovedState;
    log(url);
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    List result = body["results"] ?? [];
    return result
        .map((item) => UniversityApplicationModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<UniversityApplicationModel>> getPreviousApplications(
      {int? limit, int? offSet}) async {
    var url = apiEndpoint(offSet, limit).withNotApprovedState;
    log(url);
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    List result = body["results"] ?? [];
    return result
        .map((item) => UniversityApplicationModel.fromJson(item))
        .toList();
  }

  String apiEndpoint(int? offSet, int? limit) =>
      ApiEndpoints.universityApplication.withDocuments.withUniversity
          .withOffSet(offSet)
          .withLimit(limit)
          .withMostRecentOrder;

  @override
  Future<List<UniversityModel>> getAllUniversities() async {
    var url = ApiEndpoints.universities;
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    List result = body["results"] ?? [];
    log(result.first.toString());
    return result.map((item) => UniversityModel.fromJson(item)).toList();
  }

  @override
  Future<List<Attachments>> uploadUniversityDocumentFile(
      {required List<File> files}) async {
    var response = await Future.wait([
      for (final file in files)
        apiService.uploadSingleFile(
          file: file,
          purpose: FileUploadPurpose.UNIVERSITY_APPLICATION_DOCUMENT,
        )
    ]);
    List<Attachments> docFiles = [];
    for (var value in response) {
      final response = jsonDecode(value.body);
      final model = Attachments.fromJson(response);
      docFiles.add(model);
    }
    return docFiles;
  }

  Future<UniversityApplicationModel> uploadUniversityDocument(
      {required Map body}) async {
    var url = ApiEndpoints.universityApplication;
    var response = await apiService.post(url: url, body: body);
    var responseBody = jsonDecode(response.body);
    return UniversityApplicationModel.createJson(responseBody);
  }

  @override
  Future<UniversityApplicationModel> updateUniversityDocument(
      {required Map body, required int id}) async {
    var url = ApiEndpoints.universityApplication
        .update(id)
        .withUniversity
        .withDocuments;
    log(url);
    var response = await apiService.patch(url: url, body: body);
    var responseBody = jsonDecode(response.body);
    log("after updating uni app : ${responseBody.toString()}");
    return UniversityApplicationModel.createJson(responseBody);
  }

  @override
  Future<UniversityApplicationModel> getUniversityApplication(
      {required int id}) async {
    final url = ApiEndpoints.universityApplication.withDocuments.withUniversity;
    final response = await apiService.get(url: url);
    final object = jsonDecode(response.body);
    final model = UniversityApplicationModel.fromJson(object);
    return model;
  }
}
