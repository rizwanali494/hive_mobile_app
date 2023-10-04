import 'dart:developer';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';

abstract class ReportWidgetVM extends ChangeNotifier {
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
      log("reportttt list::  length ${list.length}");
      reports = list;
    } catch (e) {
      uiState = UiState.error();
    }
    uiState = UiState.loaded();
    Map<int?, List<ReportModel>> map =
        groupBy(reports, (item) => item.subjectId);
    log('grouping data ===');
    map.forEach((key, value) {
      log("value: $key ${value.length}");
    });
    notifyListeners();
  }

  int selectedTerm = 0;

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

class ReportYear2VM extends ReportWidgetVM {
  ReportYear2VM()
      : super(
            reportIdModel: ReportIdModel(
          midTermId: 9,
          mockTermId: 13,
          midYearId: 11,
          mockExam: 15,
        ));
}

class ReportYear1VM extends ReportWidgetVM {
  ReportYear1VM()
      : super(
            reportIdModel: ReportIdModel(
                midTermId: 1, mockTermId: 3, midYearId: 5, mockExam: 19));
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
