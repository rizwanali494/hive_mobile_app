import "dart:developer";

import "package:hive_mobile/features/reports/view_models/assessment_info_vm.dart";
import "package:hive_mobile/features/reports/view_models/report_id_model.dart";
import "package:hive_mobile/features/reports/view_models/summary_model.dart";
import "package:hive_mobile/features/reports/view_models/term_details_model.dart";

class TermDetailsVM {
  final Future<void> Function() onRefresh;
  Function(int index) selectTerm;
  Function(int index) selectExam;
  final int selectedTerm;
  final int selectedExam;
  final ReportIdModel reportIdModel;
  List<AssessmentInfoVM> assessments = [];
  List<TermDetailsModel> termDetails = [];
  String selectedExamType;
  ReportSummaryModel? assessmentSummary;

  TermDetailsVM({
    required this.selectTerm,
    required this.selectedExam,
    required this.selectExam,
    required this.reportIdModel,
    required this.assessmentSummary,
    required this.selectedTerm,
    required this.onRefresh,
    required this.selectedExamType,
    this.assessments = const [],
    required this.termDetails,
  }) {
    setSubjectName();
  }

  String get examType1 {
    if (selectedTerm == 0) {
      return "Mid Term Assessment";
    }
    return "Mid Term Assessment";
  }

  String get examType2 {
    if (selectedTerm == 0) {
      return "Mid Year Exams";
    }
    return "Mock Exams";
  }

  List<String> subjectNames = [];

  void setSubjectName() {
    final assessments1 = assessments.map((e) => e.assessment1).toList();
    final assessments2 = assessments.map((e) => e.assessment2).toList();

    Set<String> list = {};
    for (final element in assessments1 + assessments2) {
      final name = element?.subjectName;
      if (name != null) {
        list.add(name);
      }
    }
    log("subjects :: ${list}");
    subjectNames = list.toList();
  }
}
