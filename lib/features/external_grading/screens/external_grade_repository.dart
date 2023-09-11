import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/constants/file_upload_purpose.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class ExternalGradesRepo {
  late ApiService apiService;

  ExternalGradesRepo({required this.apiService});

  Future<List<ExternalGradeModel>> getInitialGradesList({int? limit});

  Future<List<ExternalGradeModel>> getNextGradesList({int? offSet, int? limit});

  Future<Attachments> uploadResultFile({required File file});

  Future<ExternalGradeModel> uploadExternalGrade({required Map map});
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
  Future<Attachments> uploadResultFile({required File file}) async {
    var response = await apiService.uploadSingleFile(
      file: file,
      purpose: FileUploadPurpose.EXTERNAL_GRADE_RESULT_FILE,
    );
    var body = jsonDecode(response.body);
    return Attachments.fromJson(body);
  }

  @override
  Future<ExternalGradeModel> uploadExternalGrade({required Map map}) async {
    var url = ApiEndpoints.externalGrade;
    var response = await apiService.post(url: url, body: map);
    var body = jsonDecode(response.body);
    return ExternalGradeModel.fromJson(body);
  }
}
