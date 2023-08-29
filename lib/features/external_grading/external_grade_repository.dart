import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class ExternalGradesRepo {
  late ApiService apiService;

  ExternalGradesRepo({required this.apiService});

  Future<List<ExternalGradeModel>> getInitialGradesList({int? limit});

  Future<List<ExternalGradeModel>> getNextGradesList({int? offSet, int? limit});
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
}
