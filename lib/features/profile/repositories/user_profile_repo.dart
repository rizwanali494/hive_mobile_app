import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/awards_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class UserProfileRepo {
  late ApiService apiService;

  UserProfileRepo({required this.apiService});

  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet});

  Future<List<AwardsModel>> getAwards({int? limit, int? offSet});
}

class UserProfileRepoImpl extends UserProfileRepo {
  UserProfileRepoImpl({required super.apiService});

  String apiEndpoint(int? offSet, int? limit) =>
      ApiEndpoints.universityApplication.withDocuments.withUniversity
          .withOffSet(offSet)
          .withLimit(limit)
          .withMostRecentOrder;

  @override
  Future<List<UniversityApplicationModel>> getAcceptedApplications(
      {int? limit, int? offSet}) async {
    var url = apiEndpoint(offSet, limit).withApprovedStatus;
    log(url);
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    List result = body["results"] ?? [];
    return result
        .map((item) => UniversityApplicationModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<AwardsModel>> getAwards({int? limit, int? offSet}) async {
    var url = ApiEndpoints.award.withLimit(limit).withOffSet(offSet);
    log(url);
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    List result = body["results"] ?? [];
    // var list = List<AwardsModel>.generate(
    //     15, (index) => AwardsModel(awardName: "Award ${index + 1}"));
    return  result
        .map((item) => AwardsModel.fromJson(item))
        .toList();;
  }
}
