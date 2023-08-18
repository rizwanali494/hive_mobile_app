import 'dart:convert';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/university_application_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class UniversityApplicationRepository {
  late ApiService apiService;

  UniversityApplicationRepository({required this.apiService});

  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet});

  Future<List<UniversityApplicationModel>> getPreviousApplications();
}

class UniversityApplicationRepoImpl extends UniversityApplicationRepository {
  UniversityApplicationRepoImpl({required super.apiService});

  @override
  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet}) async {
    var url =
        ApiEndpoints.universityApplication.withOffSet(offSet).withLimit(limit);
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
    var url =
        ApiEndpoints.universityApplication.withOffSet(offSet).withLimit(limit);
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    List result = body["results"] ?? [];
    return result
        .map((item) => UniversityApplicationModel.fromJson(item))
        .toList();
  }
}
