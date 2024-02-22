import "dart:developer";

import "package:fl_chart/fl_chart.dart";
import "package:hive_mobile/app/models/data/report_model.dart";
import "package:hive_mobile/features/reports/view_models/assessment_info_vm.dart";
import "package:hive_mobile/features/reports/view_models/report_id_model.dart";
import "package:hive_mobile/features/reports/view_models/summary_model.dart";

class TermDetailsVM {
  final Future<void> Function() onRefresh;
  Function(int index) selectTerm;
  Function(int index) selectExam;
  final int selectedTerm;
  final int selectedExam;
  final ReportIdModel reportIdModel;
  List<AssessmentInfoVM> assessments = [];
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
  }) {
    setSubjectName();
  }

  String get examType1 {
    if (selectedTerm == 0) {
      return "Mid Term Assessment";
    }
    return "Mock Term Assessment";
  }

  String get examType2 {
    if (selectedTerm == 0) {
      return "Mid year exam";
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

  LineChartBarData get lineBarsDataTerm1 {
    final list = setData(assessments.map((e) => e.assessment1).toList());
    return list;
  }

  LineChartBarData get lineBarsDataTerm2 {
    final list = setData(assessments.map((e) => e.assessment2).toList());
    return list;
  }

  LineChartBarData setData(List<ReportModel?> list) {
    List<FlSpot> spots = [];
    for (int index = 0; index < list.length; index++) {
      final value = list[index];
      final spot = FlSpot(index.toDouble(), value?.gpa ?? 0.0);
      spots.add(spot);
    }
    final lineBarsDataTerm = LineChartBarData(
      isCurved: true,
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
    lineBarsDataTerm.spots.forEach((element) {
      log("line char ${element.x} ${element.y}");
    });
    return lineBarsDataTerm;
  }
}
