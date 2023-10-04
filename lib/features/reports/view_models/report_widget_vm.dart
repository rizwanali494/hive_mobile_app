import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';

class ReportWidgetVM extends ChangeNotifier {
  final ReportIdModel reportIdModel;

  final apiService = GetIt.instance.get<ApiService>();

  late final ReportRepository reportRepository =
      ReportRepository(apiService: apiService);

  List<ReportModel> reports = [];

  ReportWidgetVM({required this.reportIdModel}) {
    getReports();
  }

  UiState uiState = UiState.loading();

  Future<void> getReports() async {
    try {
      final list = await reportRepository.getReports(ids: reportIdModel.allIds);
      reports = list;
    } catch (e) {
      uiState = UiState.error();
    }
    uiState = UiState.loaded();
    log("reports length ::::: ${reports.length}");
    notifyListeners();
  }

  int selectedTerm = 1;

  void setSelectedTerm(int index) {
    selectedTerm = index;
    notifyListeners();
  }

  List<ReportModel> get reportByTerms {
    final ids =
        (selectedTerm == 1 ? reportIdModel.term1Ids : reportIdModel.term2Ids);
    return reports.where((element) => ids.contains(element)).toList();
  }
}

class ReportIdModel {
  final midTermId;

  final mockTermId;

  final midYearId;

  final mockExam;

  const ReportIdModel({
    required this.midTermId,
    required this.mockTermId,
    required this.midYearId,
    required this.mockExam,
  });

  List<int> get allIds {
    return [
      midTermId,
      mockTermId,
      midYearId,
      mockExam,
    ];
  }

  List<int> get term1Ids {
    return [
      midTermId,
      midYearId,
    ];
  }

  List<int> get term2Ids {
    return [
      mockTermId,
      mockExam,
    ];
  }
}
