import "package:collection/collection.dart";
import "package:hive_mobile/app/models/data/report_model.dart";
import "package:hive_mobile/features/reports/view_models/assessment_info_vm.dart";
import "package:hive_mobile/features/reports/view_models/summary_model.dart";

class TermDetailsVM {
  Function(int index) selectTerm;
  final int selectedTerm;
  List<AssessmentInfoVM> assessments = [];
  ReportSummaryModel? assessmentSummary;

  TermDetailsVM({
    required this.selectTerm,
    required this.assessmentSummary,
    required this.selectedTerm,
    this.assessments = const [],
  });
}
