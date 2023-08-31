import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class ActivityRepo {
  late ApiService apiService;

  ActivityRepo({required this.apiService});

  Future<List<ActivityModel>> getInitialActivities({int? limit});

  Future<List<ActivityModel>> getNextActivities({int? offSet, int? limit});

  Future<void> submitSelection(
      {required int id, required Map body, required String state});
}

class ActivityRepositoryImpl extends ActivityRepo {
  ActivityRepositoryImpl({required super.apiService});

  String endPoint = ApiEndpoints.activity.withBanner.withOwnerObject;

  @override
  Future<List<ActivityModel>> getInitialActivities({int? limit}) async {
    log(endPoint.withLimit(limit));
    var response = await apiService.get(
      url: endPoint.withLimit(limit),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => ActivityModel.fromJson(e)).toList();
  }

  @override
  Future<List<ActivityModel>> getNextActivities(
      {int? offSet, int? limit}) async {
    var response = await apiService.get(
      url: endPoint.withLimit(limit).withOffSet(offSet),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => ActivityModel.fromJson(e)).toList();
  }

  @override
  Future<void> submitSelection(
      {required int id, required Map body, required String state}) async {
    var url = getEndpoint(id, state);
    log(url.toString());
    var response = await apiService.post(url: url, body: {});
    return;
  }

  String getEndpoint(int id, String state) {
    if (state.toLowerCase() == AppStrings.attending.toLowerCase()) {
      return "${ApiEndpoints.activity}${id}/attend/";
    }
    if (state.toLowerCase() == AppStrings.maybe.toLowerCase()) {
      return "${ApiEndpoints.activity}${id}/skeptical/";
    }
    return "${ApiEndpoints.activity}${id}/not_attend/";
  }
}
