import 'dart:developer';

import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/features/reports/view_models/report_id_model.dart';
import 'package:hive_mobile/features/reports/view_models/report_widget_vm.dart';
import 'package:collection/collection.dart';

import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';

class ReportYear1VM extends ReportWidgetVM {
  ReportYear1VM()
      : super(
            reportIdModel: ReportIdModel(
                midTermAssessmentId: 1,
                mockTermAssessmentId: 5,
                midYearId: 3,
                mockExam: 19));

  List<AssessmentInfoVM> term1Assessments = [];
}
