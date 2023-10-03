import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';
import 'package:hive_mobile/features/reports/view_models/reports_factory.dart';

class ReportsScreenVM extends ChangeNotifier {
  int selectedYear = -1;
  int selectedTerm = -1;

  ReportsScreenVM() {
    getValues();
  }

  void getValues() async {
    var list = await reportRepository.getReport();
    allReports = list;
    inItValues();
  }

  final apiService = GetIt.instance.get<ApiService>();

  late ReportRepository reportRepository =
      ReportRepository(apiService: apiService);

  void inItValues() {
    int as1 = reportFactory1.reportTerm1.midTermId ?? 0;
    int as2 = reportFactory1.reportTerm1.midYearExamId ?? 0;
    int as3 = reportFactory2.reportTerm2.mockTermId ?? 0;
    int as4 = reportFactory2.reportTerm2.mockExamId ?? 0;
    log("year 1:");
    year1 = setReportTerm(as1, as2, as3, as4);
    as1 = reportFactory2.reportTerm1.midTermId ?? 0;
    as2 = reportFactory2.reportTerm1.midYearExamId ?? 0;
    as3 = reportFactory2.reportTerm2.mockTermId ?? 0;
    as4 = reportFactory2.reportTerm2.mockExamId ?? 0;
    log("year 2:");
    year2 = setReportTerm(as1, as2, as3, as4);
  }

  void selectYear(int value) {
    selectedYear = value;
    notifyListeners();
  }

  void selectTerm(int value) {
    selectedTerm = value;
    notifyListeners();
  }

  final reportFactory1 = ReportsFactory.reportYear1;
  final reportFactory2 = ReportsFactory.reportYear2;

  ReportYearModel? year1;
  ReportYearModel? year2;

  List<ReportModel> allReports = [];

  ReportYearModel setReportTerm(int as1, int as2, int as3, int as4) {
    final term1 = setAssessments(as1, as2);
    final term2 = setAssessments(as3, as4);
    return ReportYearModel(term1: term1, term2: term2);
  }

  ReportTermModel setAssessments(int id1, int id2) {
    final AssessmentModel assessment1 = AssessmentModel(id: id1 ?? 0);
    final AssessmentModel assessment2 = AssessmentModel(id: id2 ?? 0);
    assessment1.reports = getReportByAssessmentId(assessment1.id);
    assessment2.reports = getReportByAssessmentId(assessment2.id);
    return ReportTermModel(assessment1: assessment1, assessment2: assessment1);
  }

  List<ReportModel> getReportByAssessmentId(int? id) {
    var list = allReports.where((element) {
      log("message : ${element.assessmentId}");
      return element.assessmentId == id;
    }).toList();
    log("list:: $id length ${list.length}");
    return list;
  }
}

class ReportYearModel {
  late ReportTermModel term1;
  late ReportTermModel term2;

  ReportYearModel({
    required this.term1,
    required this.term2,
  });
}

class ReportTermModel {
  final AssessmentModel assessment1;
  final AssessmentModel assessment2;

  const ReportTermModel({
    required this.assessment1,
    required this.assessment2,
  });
}

class AssessmentModel {
  final int id;

  List<ReportModel> reports = [];

  AssessmentModel({
    required this.id,
    this.reports = const [],
  });
}

class Record {
  final String id;
  final String title;
  final String description;

  Record({required this.id, required this.title, required this.description});
}
