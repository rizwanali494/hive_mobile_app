import 'dart:developer';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';
import 'package:hive_mobile/features/reports/view_models/report_id_model.dart';

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
      sortTerm1Items();
    } catch (e) {
      uiState = UiState.error();
    }
    uiState = UiState.loaded();
    notifyListeners();
  }

  int selectedTerm = 0;

  void sortTerm1Items();

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



