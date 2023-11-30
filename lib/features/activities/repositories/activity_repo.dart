import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class ActivityRepo {
  late ApiService apiService;

  ActivityRepo({required this.apiService});

  Future<List<ActivityModel>> getInitialActiveActivities({int? limit});

  Future<List<ActivityModel>> getNextActiveActivities(
      {int? offSet, int? limit});

  Future<List<ActivityModel>> getAllActivities({int? offSet, int? limit});

  Future<ActivityModel> getActivity({required int id});

  Future<void> submitSelection(
      {required int id, required Map body, required String state});
}

class ActivityRepositoryImpl extends ActivityRepo {
  ActivityRepositoryImpl({required super.apiService});

  String activeEventsEndpoint = ApiEndpoints
      .activity.withBanner.withOwnerObject.withMostRecentOrder.withDateGTE;

  String allEventsEndpoint =
      ApiEndpoints.activity.withBanner.withOwnerObject.withMostRecentOrder;

  @override
  Future<List<ActivityModel>> getInitialActiveActivities({int? limit}) async {
    log("Activity URL is ${activeEventsEndpoint.withLimit(10)}");
    var response = await apiService.get(
      url: activeEventsEndpoint.withLimit(limit),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => ActivityModel.fromJson(e)).toList();
  }

  @override
  Future<List<ActivityModel>> getNextActiveActivities(
      {int? offSet, int? limit}) async {
    log("Activity URL is ${activeEventsEndpoint.withLimit(limit).withOffSet(offSet)}");

    var response = await apiService.get(
      url: activeEventsEndpoint.withLimit(limit).withOffSet(offSet),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => ActivityModel.fromJson(e)).toList();
  }

  @override
  Future<List<ActivityModel>> getAllActivities(
      {int? offSet, int? limit}) async {
    var response = await apiService.get(
      url: allEventsEndpoint.withLimit(limit).withOffSet(offSet),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => ActivityModel.fromJson(e)).toList();
  }

  @override
  Future<void> submitSelection(
      {required int id, required Map body, required String state}) async {
    var url = getEndpoint(id, state);
    var response = await apiService.post(url: url, body: {});
    return;
  }

  String getEndpoint(int id, String state) {
    if (state.toLowerCase() == AppStrings.attending.toLowerCase()) {
      return "${selectionEndpoint(id)}attend/";
    }
    if (state.toLowerCase() == AppStrings.SKEPTICAL.toLowerCase()) {
      return "${selectionEndpoint(id)}skeptical/";
    }
    return "${selectionEndpoint(id)}not_attend/";
  }

  String selectionEndpoint(int id) {
    return "${ApiEndpoints.activity}${id}/";
  }

  @override
  Future<ActivityModel> getActivity({required int id}) {}
}
