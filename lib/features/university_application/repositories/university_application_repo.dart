import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/constants/file_upload_purpose.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/file_upload_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class UniversityApplicationRepository {
  late ApiService apiService;

  UniversityApplicationRepository({required this.apiService});

  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet});

  Future<List<UniversityApplicationModel>> getPreviousApplications(
      {int? limit, int? offSet});

  Future<List<UniversityModel>> getAllUniversities();

  Future<FileUploadModel> uploadUniversityDocumentFile({required File file});

  Future<UniversityApplicationModel> uploadUniversityDocument(
      {required Map body});
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
    var url = apiEndpoint(offSet, limit).withNotApprovedApplications;
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
  Future<FileUploadModel> uploadUniversityDocumentFile(
      {required File file}) async {
    var url = ApiEndpoints.universities;
    var response = await apiService.uploadSingleFile(
        file: file,
        purpose: FileUploadPurpose.UNIVERSITY_APPLICATION_DOCUMENT,
        url: ApiEndpoints.upload);
    var body = jsonDecode(response.body);
    return FileUploadModel.fromJson(body);
  }

  Future<UniversityApplicationModel> uploadUniversityDocument(
      {required Map body}) async {
    var url = ApiEndpoints.universityApplication;
    var response = await apiService.post(url: url, body: body);
    var responseBody = jsonDecode(response.body);
    return UniversityApplicationModel.fromJson(responseBody);
  }
}
