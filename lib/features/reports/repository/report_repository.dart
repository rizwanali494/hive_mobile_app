import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/view_models/summary_model.dart';

class ReportRepository {
  final ApiService apiService;

  ReportRepository({required this.apiService});

  Future<List<ReportModel>> getReports({required List<int> ids}) async {
    // var url = ApiEndpoints.assessments.withAssessmentIds([1, 3, 5, 19, 9, 11, 13, 15]);
    var url = ApiEndpoints.assessments.withAssessmentIds(ids);
    var response = await apiService.get(url: url);
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    log("message: ${list.length}");
    return list.map((item) => ReportModel.fromJson(item)).toList();
  }

  Future<ReportSummaryModel> getSummary({required List<int> ids}) async {
    var url = ApiEndpoints.summary.withAssessmentIds(ids);
    var response = await apiService.get(url: url);
    log("ids : ${ids}");
    var result = jsonDecode(response.body);
    log("body : ${result}");
    final model = ReportSummaryModel.fromMap(result);
    return model;
  }

  Future<String> generateReportToken() async {
    var url = ApiEndpoints.reportToken;
    var response = await apiService.get(url: url);
    var result = jsonDecode(response.body);
    log("body : ${result}");
    String reportToken = result["token"];
    return reportToken;
  }
}
