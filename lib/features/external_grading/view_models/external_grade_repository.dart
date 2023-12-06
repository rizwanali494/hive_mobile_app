import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/constants/file_upload_purpose.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/models/data/subject_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class ExternalGradesRepo {
  late ApiService apiService;

  ExternalGradesRepo({required this.apiService});

  Future<List<ExternalGradeModel>> getInitialGradesList({int? limit});

  Future<List<ExternalGradeModel>> getNextGradesList({int? offSet, int? limit});

  Future<List<Attachments>?> uploadResultFile({required List<File> files});

  Future<ExternalGradeModel> uploadExternalGrade({required Map map});

  Future<ExternalGradeModel> getExternalGrade(int id);

  Future<ExternalGradeModel> updateExternalGrade(
      {required Map map, required int id});

  Future<SubjectModel> uploadSubject({required Map map});

  Future<void> updateSubject({required Map map, required int id});

  Future<List<SubjectModel>> getAllSubjects({required int id});

  Future<void> deleteSubject({required int id});

  Future<void> deleteExternalGrade({required int id});
}

class ExternalGradeRepositoryImpl extends ExternalGradesRepo {
  ExternalGradeRepositoryImpl({required super.apiService});

  @override
  Future<List<ExternalGradeModel>> getInitialGradesList({int? limit}) async {
    var response = await apiService.get(
      url: endpoint.withLimit(limit),
    );
    log(endpoint.withLimit(limit));
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => ExternalGradeModel.fromJson(e)).toList();
  }

  String get endpoint => ApiEndpoints
      .externalGrade.withSubjects.withResultFile.withMostRecentOrder;

  @override
  Future<List<ExternalGradeModel>> getNextGradesList(
      {int? offSet, int? limit}) async {
    var response = await apiService.get(
      url: endpoint.withLimit(limit).withOffSet(offSet),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => ExternalGradeModel.fromJson(e)).toList();
  }

  @override
  Future<List<Attachments>?> uploadResultFile(
      {required List<File> files}) async {
    var response = await Future.wait([
      for (final file in files)
        apiService.uploadSingleFile(
          file: file,
          purpose: FileUploadPurpose.EXTERNAL_GRADE_RESULT_FILE,
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

  @override
  Future<ExternalGradeModel> uploadExternalGrade({required Map map}) async {
    var url = ApiEndpoints.externalGrade;
    var response = await apiService.post(url: url, body: map);
    var body = jsonDecode(response.body);
    return ExternalGradeModel.createJson(body);
  }

  @override
  Future<SubjectModel> uploadSubject({required Map map}) async {
    var url = ApiEndpoints.subject;
    var response = await apiService.post(url: url, body: map);
    var body = jsonDecode(response.body);
    return SubjectModel.fromJson(body);
  }

  @override
  Future<List<SubjectModel>> getAllSubjects({required int id}) async {
    var url = ApiEndpoints.subject.externalGrade(id);
    log(url.toString());
    var response = await apiService.get(url: url);
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => SubjectModel.fromJson(e)).toList();
  }

  @override
  Future<void> deleteSubject({required int id}) async {
    var url = ApiEndpoints.subject.withId(id);
    var response = await apiService.delete(url: url);
    return;
  }

  @override
  Future<void> updateSubject({required Map map, required int id}) async {
    var url = ApiEndpoints.subject.withId(id);
    log("$id :: ${jsonEncode(map)} ${url}");
    var response = await apiService.patch(url: url, body: map);
    return;
  }

  @override
  Future<ExternalGradeModel> updateExternalGrade(
      {required Map map, required int id}) async {
    var url = ApiEndpoints.externalGrade.withId(id);
    var response = await apiService.patch(url: url, body: map);
    var body = jsonDecode(response.body);
    return ExternalGradeModel.createJson(body);
  }

  @override
  Future<void> deleteExternalGrade({required int id}) async {
    var url = ApiEndpoints.externalGrade.withId(id);
    var response = await apiService.delete(url: url);
    return;
  }

  @override
  Future<ExternalGradeModel> getExternalGrade(int id) async {
    final url = ApiEndpoints.externalGrade
        .withId(id)
        .withSubjects
        .withResultFile
        .withMostRecentOrder;
    final response = await apiService.get(url: url);
    final object = jsonDecode(response.body);
    final model = ExternalGradeModel.fromJson(object);
    return model;
  }
}
