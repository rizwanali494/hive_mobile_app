import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';
import 'package:hive_mobile/features/reports/view_models/summary_model.dart';
import 'package:collection/collection.dart';

class ReportTableVM {
  List<AssessmentInfoVM> termDetails = [];
  ReportSummaryModel? model;
  final String examType;

  ReportTableVM(
      {required this.termDetails, required this.model,required this.examType,});

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

  String get meanGPA {
    return model?.meanGPA.toString() ?? "";
  }

  String get topGPA {
    return model?.topGPA.toString() ?? "";
  }

  String get bottomGPA {
    return model?.bottomGPA.toString() ?? "";
  }
}
