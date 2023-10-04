import "package:collection/collection.dart";
import "package:hive_mobile/app/models/data/report_model.dart";

class TermDetailsVM {
  Function(int index) selectTerm;
  final int selectedTerm;
  List<ReportModel> reports = [];

  TermDetailsVM({
    required this.selectTerm,
    required this.selectedTerm,
  });

  void groupByModel() {
    Map<int?, List<ReportModel>> map =
        groupBy(reports, (item) => item.subjectId);
  }
}
