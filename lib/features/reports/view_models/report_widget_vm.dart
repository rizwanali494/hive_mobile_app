import 'dart:developer';
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/models/data/reports_model_new.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';
import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';
import 'package:hive_mobile/features/reports/view_models/report_id_model.dart';
import 'package:hive_mobile/features/reports/view_models/summary_model.dart';
import 'package:hive_mobile/features/reports/view_models/term_details_model.dart';

abstract class ReportWidgetVM extends ChangeNotifier
    with BaseExceptionController {
  final ReportIdModel reportIdModel;

  final apiService = GetIt.instance.get<ApiService>();

  late final ReportRepository reportRepository =
      ReportRepository(apiService: apiService);

  List<ReportModel> reports = [];

  ReportWidgetVM({required this.reportIdModel, required this.newReports}) {
    // getReports();
  }

  UiState uiState = UiState.loading();

  bool get isLoading {
    return uiState.isLoading;
  }

  Future<void> getReports() async {
    try {
      final list = await reportRepository.getReports(ids: reportIdModel.allIds);
      reports = list;
      var models = await Future.wait([
        getTermSummary(reportIdModel.term1Ids),
        getTermSummary(reportIdModel.term2Ids),
      ]);
      term1Summary = models.firstOrNull;
      term2Summary = models.elementAtOrNull(1);
      sortItems();
    } catch (e) {
      onError(e);
      uiState = UiState.error();
    }
    uiState = UiState.loaded();
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await getReports();
    return;
  }

  int selectedTerm = 0;
  int selectedExam = 0;

  List<AssessmentInfoVM> get termAssessments {
    if (selectedTerm == 0) {
      return _term1Assessments;
    }
    return _term2Assessments;
  }

  void setSelectedTerm(int index) {
    selectedTerm = index;
    selectedExam = 0;
    notifyListeners();
  }

  void setExamType(int index) {
    log("Term ${selectedTerm}");
    log("Exam $index");
    log("Selected ${selectedExamType}");
    selectedExam = index;
    notifyListeners();
  }

  ReportSummaryModel? get summaryByTerm {
    return selectedTerm == 0 ? term1Summary : term2Summary;
  }

  List<AssessmentInfoVM> get reportsByAssessmentType {
    final ids =
        (selectedTerm == 0 ? reportIdModel.term1Ids : reportIdModel.term2Ids);
    var list =
        termAssessments.where((element) => ids.contains(element.id)).toList();
    log("length : ${list.length}");
    return list;
  }

  List<AssessmentInfoVM> _term1Assessments = [];

  List<AssessmentInfoVM> _term2Assessments = [];

  sortItems() {
    _term1Assessments = [];
    _term2Assessments = [];
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
    groupedElements.forEach((key, value) {
      var id = key ?? 0;
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

  void onError(dynamic error);

  Map<int, String> termExam1 = {
    0: "Mid Term Assessment",
    1: "Mid Year Exams",
  };
  Map<int, String> termExam2 = {
    0: "Mid Term Assessment",
    1: "Mock Exams",
  };

  String get termAssessment1 => termExam1[selectedTerm] ?? "";

  String get termAssessment2 => termExam2[selectedTerm] ?? "";

  String get selectedExamType {
    if (selectedTerm == 0) {
      return termExam1[selectedExam] ?? "";
    }
    return termExam2[selectedExam] ?? "";
  }

  // New

  List<ReportsModelNew> newReports;

  List<TermDetailsModel> get term1List1;

  List<TermDetailsModel> get term1List2;

  List<TermDetailsModel> get term2List1;

  List<TermDetailsModel> get term2List2;

  late Map<int, examListType> getExamType = {
    0: getExamList1,
    1: getExamList2,
  };

  late examListType getExamList1 = {
    0: term1List1,
    1: term1List2,
  };
  late examListType getExamList2 = {
    0: term2List1,
    1: term2List2,
  };

  List<TermDetailsModel> get getCurrentExamList {
    final termType = getExamType[selectedTerm];
    final list = termType?[selectedExam] ?? [];
    return list;
  }

  void updateReport(List<ReportsModelNew> list) {
    this.newReports = list;
    notifyListeners();
  }
}

typedef examListType = Map<int, List<TermDetailsModel>>;
