import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';
import 'package:hive_mobile/features/reports/view_models/term_details_vm.dart';
import 'package:collection/collection.dart';

class ReportTableVM {
  List<AssessmentInfoVM> termDetails = [];

  ReportTableVM({required this.termDetails});

  String get teachersName {
    return termDetails.firstOrNull?.assessment1?.sectionName ?? "-";
  }

  String get assessment1AvgGPA {
    double gpa = 0.0;
    int assessmentCount = 0;
    for (var value in termDetails) {
      gpa += value.assessment1?.gpa ?? 0.0;
      assessmentCount++;
    }
    if (assessmentCount < 1) {
      return "0";
    }
    return (gpa / assessmentCount).toStringAsPrecision(3);
  }

  String get assessment2AvgGPA {
    double gpa = 0.0;
    int assessmentCount = 0;
    for (var value in termDetails) {
      gpa += value.assessment2?.gpa ?? 0.0;
      assessmentCount++;
    }
    if (assessmentCount < 1) {
      return "0";
    }
    return (gpa / assessmentCount).toStringAsPrecision(3);
  }

  String get assessmentsAvgCGPA {
    double gpa = 0.0;
    int assessmentCount = 0;
    for (var value in termDetails) {
      gpa += value.cgpa;
      assessmentCount++;
    }
    if (assessmentCount < 1) {
      return "0";
    }
    return (gpa / assessmentCount).toStringAsPrecision(3);
  }
}
