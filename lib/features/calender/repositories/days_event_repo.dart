import 'dart:convert';
import 'dart:developer';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

class DaysEventRepo {
  final ApiService service;

  final limit = 365;

  DaysEventRepo({required this.service});

  Future<List<ActivityModel>> getAllEvents(
      {required DateTime startDate,
      required DateTime endDate,
      int? limit,
      int? offset}) async {
    var url = ApiEndpoints.activity.withBanner.withOwnerObject
        .withLimit(limit)
        .dateLessThan(endDate.yearMonthDay)
        .dateGreaterThan(startDate.yearMonthDay);
    log("link : $url");
    var response = await service.get(url: url);
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((item) => ActivityModel.fromJson(item)).toList();
  }
}
