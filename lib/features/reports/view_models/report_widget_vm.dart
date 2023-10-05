import 'dart:developer';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';
import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';
import 'package:hive_mobile/features/reports/view_models/report_id_model.dart';
import 'package:hive_mobile/features/reports/view_models/summary_model.dart';

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
      var models = await Future.wait([
        getTermSummary(reportIdModel.term1Ids),
        getTermSummary(reportIdModel.term2Ids),
      ]);
      term1Summary = models.firstOrNull;
      term2Summary = models.elementAtOrNull(1);
      log("term1Summary :${term1Summary}");
      log("term2Summary :${term2Summary}");
      sortItems();
    } catch (e) {
      log("message ${e.toString()}");
      uiState = UiState.error();
    }
    uiState = UiState.loaded();
    notifyListeners();
  }

  int selectedTerm = 0;

  List<AssessmentInfoVM> get termAssessments {
    if (selectedTerm == 0) {
      return _term1Assessments;
    }
    return _term2Assessments;
  }

  void setSelectedTerm(int index) {
    selectedTerm = index;
    notifyListeners();
  }

  ReportSummaryModel? get summaryByTerm {
    return selectedTerm == 0 ? term1Summary : term2Summary;
  }

  // List<ReportModel> get reportByTerms {
  //   final ids =
  //       (selectedTerm == 0 ? reportIdModel.term1Ids : reportIdModel.term2Ids);
  //   return reports.where((element) => ids.contains(element)).toList();
  // }

  List<AssessmentInfoVM> _term1Assessments = [];

  List<AssessmentInfoVM> _term2Assessments = [];

  sortItems() {
    sortTerm1Items();
    sortTerm2Items();
  }

  void sortTerm1Items() {
    var term1Reports = reports
        .where(
            (element) => reportIdModel.term1Ids.contains(element.assessmentId))
        .toList();
    Map<int?, List<ReportModel>> groupedElements =
        groupBy(term1Reports, (item) => item.subjectId);
    term1Reports.forEach((element) {
    });
    groupedElements.forEach((key, value) {
      var id = key ?? 0;
      log("message :::: $id");
      ReportModel model1 = ReportModel();
      ReportModel model2 = ReportModel();
      for (var element in value) {
        if (element.assessmentId == reportIdModel.midTermAssessmentId) {
          model1 = element;
        } else if (element.assessmentId == reportIdModel.midYearId) {
          model2 = element;
        }
      }
      AssessmentInfoVM assessmentInfoVM =
          AssessmentInfoVM(id: id, assessment1: model1, assessment2: model2);
      _term1Assessments.add(assessmentInfoVM);
    });
  }

  void sortTerm2Items() {
    var term1Reports = reports
        .where(
            (element) => reportIdModel.term2Ids.contains(element.assessmentId))
        .toList();
    Map<int?, List<ReportModel>> groupedElements =
        groupBy(term1Reports, (item) => item.subjectId);
    term1Reports.forEach((element) {
      log("message 11 : ${element.subjectId}");
    });
    groupedElements.forEach((key, value) {
      var id = key ?? 0;
      ReportModel model1 = ReportModel();
      ReportModel model2 = ReportModel();
      for (var element in value) {
        if (element.assessmentId == reportIdModel.mockTermAssessmentId) {
          model1 = element;
        } else if (element.assessmentId == reportIdModel.mockExam) {
          model2 = element;
        }
      }
      AssessmentInfoVM assessmentInfoVM =
          AssessmentInfoVM(id: id, assessment1: model1, assessment2: model2);
      _term1Assessments.add(assessmentInfoVM);
    });
  }

  ReportSummaryModel? term1Summary;
  ReportSummaryModel? term2Summary;

  Future<ReportSummaryModel> getTermSummary(List<int> ids) async {
    final model = await reportRepository.getSummary(ids: ids);
    return model;
  }
}
