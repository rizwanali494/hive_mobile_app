import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/reports_model_new.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';

class ReportDataController extends ChangeNotifier {
  final apiService = GetIt.instance.get<ApiService>();
  late final ReportRepository reportRepository =
      ReportRepository(apiService: apiService);
  List<ReportsModelNew> reports = [];

  ReportDataController() {
    getReports();
  }

  UiState uiState = UiState.loading();

  bool get isLoading {
    return uiState.isLoading;
  }

  Future<void> getReports() async {
    try {
      final list = await reportRepository.getNewReports();
      reports = list;
      log("Got Reports :: ${list.length}");
    } catch (e) {
      // onError(e);
      log("The error in reports is ${e}");
      uiState = UiState.error();
    }
    uiState = UiState.loaded();
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await getReports();
    return;
  }
}
