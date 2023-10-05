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

  List<ReportModel> get reportByTerms {
    final ids =
        (selectedTerm == 1 ? reportIdModel.term1Ids : reportIdModel.term2Ids);
    return reports.where((element) => ids.contains(element)).toList();
  }

  List<AssessmentInfoVM> _term1Assessments = [];

  List<AssessmentInfoVM> _term2Assessments = [];

  sortItems() {
    log("ids : ${reportIdModel.term1Ids}");
    log("ids : ${reportIdModel.term2Ids}");
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
      log("message 11 : ${element.subjectId}");
    });
    groupedElements.forEach((key, value) {
      var id = key ?? 0;
      log("message :::: $id");
      ReportModel model1 = ReportModel();
      ReportModel model2 = ReportModel();
      for (var element in value) {
        if (element.assessmentId == reportIdModel.midTermAssessmentId) {
          log("message :::: assessmentId ${element.assessmentId} midyear ${reportIdModel.midTermAssessmentId}");
          model1 = element;
        } else if (element.assessmentId == reportIdModel.midYearId) {
          log("message :::: assessmentId ${element.assessmentId} midyear ${reportIdModel.midYearId}");
          model2 = element;
        }
      }
      AssessmentInfoVM assessmentInfoVM =
          AssessmentInfoVM(id: id, assessment1: model1, assessment2: model2);
      _term1Assessments.add(assessmentInfoVM);
    });
    for (var value1 in _term1Assessments) {
      log("term1 ${value1.id} ${value1.assessment1?.assessmentId} ${value1.assessment2?.assessmentId} ");
    }
    log("sorted term 1");
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
      log("message :::: $id");
      ReportModel model1 = ReportModel();
      ReportModel model2 = ReportModel();
      for (var element in value) {
        if (element.assessmentId == reportIdModel.mockTermAssessmentId) {
          log("message :::: assessmentId ${element.assessmentId} midyear ${reportIdModel.midTermAssessmentId}");
          model1 = element;
        } else if (element.assessmentId == reportIdModel.mockExam) {
          log("message :::: assessmentId ${element.assessmentId} midyear ${reportIdModel.midYearId}");
          model2 = element;
        }
      }
      AssessmentInfoVM assessmentInfoVM =
          AssessmentInfoVM(id: id, assessment1: model1, assessment2: model2);
      _term1Assessments.add(assessmentInfoVM);
    });
    for (var value1 in _term1Assessments) {
      log("term1 ${value1.id} ${value1.assessment1?.assessmentId} ${value1.assessment2?.assessmentId} ");
    }
    log("sorted term 2");
  }

  ReportSummaryModel? term1Summary;
  ReportSummaryModel? term2Summary;

  Future<ReportSummaryModel> getTermSummary(List<int> ids) async {
    final model = await reportRepository.getSummary(ids: ids);
    return model;
  }
}
