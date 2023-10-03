import 'package:flutter/material.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/features/reports/view_models/reports_factory.dart';

class ReportsScreenVM extends ChangeNotifier {
  int selectedYear = -1;
  int selectedTerm = -1;

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

  ReportYearModel setReportTerm() {
    final term1 = setAssessments(id1, id2);
    final term2 = setAssessments(id1, id2);
    return ReportYearModel(term1: term1, term2: term2);
  }

  ReportTermModel setAssessments(int id1, int id2) {
    Map<String, Map<int, ReportModel>> map;

    final AssessmentModel assessment1 = AssessmentModel(id: id1 ?? 0);
    final AssessmentModel assessment2 = AssessmentModel(id: id2 ?? 0);
    assessment1.reports = getReportByAssessmentId(assessment1.id);
    assessment2.reports = getReportByAssessmentId(assessment2.id);
    return ReportTermModel(assessment1: assessment1, assessment2: assessment1);
  }

  List<ReportModel> getReportByAssessmentId(int? id) {
    return allReports.where((element) => element.assessmentId == id).toList();
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
