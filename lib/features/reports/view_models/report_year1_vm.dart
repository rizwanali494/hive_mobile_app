import 'package:hive_mobile/app/models/data/reports_model_new.dart';
import 'package:hive_mobile/features/reports/view_models/report_id_model.dart';
import 'package:hive_mobile/features/reports/view_models/report_widget_vm.dart';
import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';
import 'package:hive_mobile/features/reports/view_models/term_details_model.dart';

class ReportYear1VM extends ReportWidgetVM {
  ReportYear1VM({super.newReports = const []})
      : super(
            reportIdModel: ReportIdModel(
                midTermAssessmentId: 1,
                mockTermAssessmentId: 5,
                midYearId: 3,
                mockExam: 19));

  List<AssessmentInfoVM> term1Assessments = [];

  @override
  void onError(error) {
    handleException(error);
  }

  @override
  // TODO: implement examList1
  List<TermDetailsModel> get term1List1 {
    final list = newReports.map((element) {
          final model = TermDetailsModel(
            subjectName: element.subjectName,
            teacherId: element.midtrmYr1Trm1TchrId?.toInt(),
            teacherName: element.midtrmYr1Trm1TchrNm,
            attendance: element.presentPercentageYr1Trm1,
            subjectPercentage: element.midtrmYr1Trm1?.toString(),
            gpa: element.midtrmYr1Trm1Gpa,
            subjectGrade: element.midtrmYr1Trm1Gd,
          );
          return model;
        })
        .toList()
        .where((element) => element.isValid)
        .toList();

    return list;
  }

  @override
  // TODO: implement examList2
  List<TermDetailsModel> get term1List2 {
    final list = newReports.map((element) {
          final model = TermDetailsModel(
            subjectName: element.subjectName,
            teacherId: element.midyrYr1Trm1TchrId?.toInt(),
            teacherName: element.midyrYr1Trm1TchrNm,
            attendance: element.presentPercentageYr1Trm1,
            subjectPercentage: element.midyrYr1Trm1?.toString(),
            gpa: element.midyrYr1Trm1Gpa,
            subjectGrade: element.midyrYr1Trm1Gd,
          );
          return model;
        })
        .toList()
        .where((element) => element.isValid)
        .toList();
    ;
    return list;
  }

  @override
  // TODO: implement examList3
  List<TermDetailsModel> get term2List1 {
    final list = newReports.map((element) {
          final model = TermDetailsModel(
            subjectName: element.subjectName,
            teacherId: element.midtrmYr1Trm2TchrId?.toInt(),
            teacherName: element.midtrmYr1Trm2TchrNm,
            attendance: element.presentPercentageYr1Tr2,
            subjectPercentage: element.midtrmYr1Trm2?.toString(),
            gpa: element.midtrmYr1Trm2Gpa,
            subjectGrade: element.midtrmYr1Trm2Gd,
          );
          return model;
        })
        .toList()
        .where((element) => element.isValid)
        .toList();

    return list;
  }

  @override
  // TODO: implement examList4
  List<TermDetailsModel> get term2List2 {
    final list = newReports.map((element) {
          final model = TermDetailsModel(
            subjectName: element.subjectName,
            teacherId: element.mockexYr1Tr2TchrId?.toInt(),
            teacherName: element.mockexYr1Tr2TchrNm,
            attendance: element.presentPercentageYr1Tr2,
            subjectPercentage: element.mockexYr1Tr2?.toString(),
            gpa: element.mockexYr1Tr2Gpa,
            subjectGrade: element.mockexYr1Tr2Gd,
          );
          return model;
        })
        .toList()
        .where((element) => element.isValid)
        .toList();

    return list;
  }
}
