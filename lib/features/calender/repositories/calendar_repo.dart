import 'dart:convert';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class CalendarRepo {
  final ApiService apiService;

  CalendarRepo({required this.apiService});

  Future<List<ActivityModel>> getAllEvents();
}

class CalendarRepoImpl extends CalendarRepo {
  final limit = 365;

  CalendarRepoImpl({required super.apiService});

  @override
  Future<List<ActivityModel>> getAllEvents() async {
    var url = ApiEndpoints.activity.withLimit(limit);
    var response = await apiService.get(url: url);
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((item) => ActivityModel.fromJson(item)).toList();
  }
}
