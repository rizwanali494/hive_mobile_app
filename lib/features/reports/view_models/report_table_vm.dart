import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';
import 'package:hive_mobile/features/reports/view_models/term_details_vm.dart';
import 'package:collection/collection.dart';

class ReportTableVM {
  List<AssessmentInfoVM> termDetails = [];

  ReportTableVM({required this.termDetails});

  String get teachersName {
    return termDetails.firstOrNull?.assessment1?.sectionName ?? "-";
  }
}
