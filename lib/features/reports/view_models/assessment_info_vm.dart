import 'package:hive_mobile/app/models/data/report_model.dart';

class AssessmentInfoVM {
  int id;
  final ReportModel assessment1;
  final ReportModel assessment2;

  AssessmentInfoVM({
    required this.id,
    required this.assessment1,
    required this.assessment2,
  });

  @override
  String toString() {
    return 'AssessmentInfoVM{id: $id, assessment1: $assessment1, assessment2: $assessment2}';
  }
}
