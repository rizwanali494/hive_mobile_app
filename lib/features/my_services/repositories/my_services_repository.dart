import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class MyServicesRepository {
  late ApiService apiService;

  MyServicesRepository({required this.apiService});

  Future<List<MyServicesModel>> getInitialServicesList(
      {int? offSet, int? limit, String? apiUrl});

  Future<MyServicesModel> getServiceRequest({required int id});

  Future<Map<String, int>> getServicesStatus();
}

class MyServicesRepositoryImpl extends MyServicesRepository {
  MyServicesRepositoryImpl({required super.apiService});

  @override
  Future<List<MyServicesModel>> getInitialServicesList(
      {int? offSet, int? limit, String? apiUrl}) async {
    var url = apiUrl?.withMostRecentOrder.withOffSet(offSet).withLimit(limit) ??
        endPoint(limit, offSet);

    var response = await apiService.get(
      url: url,
    );
    var result = jsonDecode(response.body);
    List items = result["results"] ?? [];
    return items.map((item) => MyServicesModel.fromJson(item)).toList();
  }

  String endPoint(int? limit, int? offSet) {
    return apiEndPoint.withLimit(limit).withOffSet(offSet).withMostRecentOrder;
  }

  String get apiEndPoint => ApiEndpoints.serviceRequest;

  @override
  Future<Map<String, int>> getServicesStatus() async {
    var approvedUrl = apiEndPoint.withCount.withApprovedState;
    var pendingUrl = apiEndPoint.withCount.withPendingState;
    var rejectedUrl = apiEndPoint.withCount.withRejectedState;
    log(approvedUrl);
    log(pendingUrl);
    log(rejectedUrl);
    var responses = await Future.wait([
      apiService.get(url: approvedUrl),
      apiService.get(url: pendingUrl),
      apiService.get(url: rejectedUrl),
    ]);
    var approvedResponse = jsonDecode(responses[0].body);
    var pendingResponse = jsonDecode(responses[1].body);
    var rejectedResponse = jsonDecode(responses[2].body);
    for (var res in responses) {
      log(res.body.toString());
    }
    Map<String, int> map = {};
    map[AppStrings.approved.toLowerCase()] =
        approvedResponse[AppStrings.count] ?? 0;
    map[AppStrings.pending.toLowerCase()] =
        pendingResponse[AppStrings.count] ?? 0;
    map[AppStrings.rejected.toLowerCase()] =
        rejectedResponse[AppStrings.count] ?? 0;
    return map;
  }

  @override
  Future<MyServicesModel> getServiceRequest({required int id}) async {
    final url = apiEndPoint.withId(id);
    final response = await apiService.get(url: url);
    final object = jsonDecode(response.body);
    final model = MyServicesModel.fromJson(object);
    return model;
  }
}
