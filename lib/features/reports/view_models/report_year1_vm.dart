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

  @override
  void sortTerm1Items() {
    log("ids : ${reportIdModel.term1Ids}");
    var term1Reports = reports
        .where(
            (element) => reportIdModel.term1Ids.contains(element.assessmentId))
        .toList();
    Map<int?, List<ReportModel>> groupedElements =
        groupBy(term1Reports, (item) => item.subjectId);
    term1Reports.forEach((element) {
      log("message 11 : ${element.subjectId}");
    });
    groupedElements.forEach((key, value) {
      var id = key ?? 0;
      log("message :::: $id");
      ReportModel model1 = ReportModel();
      ReportModel model2 = ReportModel();
      for (var element in value) {
        if (element.assessmentId == reportIdModel.midTermAssessmentId) {
          log("message :::: assessmentId ${element.assessmentId} midyear ${reportIdModel.midTermAssessmentId}");
          model1 = element;
        } else if (element.assessmentId == reportIdModel.midYearId) {
          log("message :::: assessmentId ${element.assessmentId} midyear ${reportIdModel.midYearId}");
          model2 = element;
        }
      }
      AssessmentInfoVM assessmentInfoVM =
          AssessmentInfoVM(id: id, assessment1: model1, assessment2: model2);
      term1Assessments.add(assessmentInfoVM);
    });
    for (var value1 in term1Assessments) {
      log("term1 ${value1.id} ${value1.assessment1.assessmentId} ${value1.assessment2.assessmentId} ");
    }
  }
}
