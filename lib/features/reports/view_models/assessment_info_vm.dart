import 'package:hive_mobile/app/models/data/report_model.dart';

class AssessmentInfoVM {
  int id;
  final ReportModel? assessment1;
  final ReportModel? assessment2;

  AssessmentInfoVM({
    required this.id,
    this.assessment1,
    this.assessment2,
  });

  double get cgpa {
    var gpaSum = (assessment1?.gpa ?? 0) + (assessment2?.gpa ?? 0);
    if (gpaSum < 1) {
      return 0;
    }
    return (gpaSum / 2);
  }

  @override
  String toString() {
    return 'AssessmentInfoVM{id: $id, assessment1: $assessment1, assessment2: $assessment2}';
  }
}
