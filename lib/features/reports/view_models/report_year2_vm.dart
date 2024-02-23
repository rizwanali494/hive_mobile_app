import 'package:hive_mobile/features/reports/view_models/report_id_model.dart';
import 'package:hive_mobile/features/reports/view_models/report_widget_vm.dart';
import 'package:hive_mobile/features/reports/view_models/term_details_model.dart';

class ReportYear2VM extends ReportWidgetVM {
  ReportYear2VM({super.newReports = const []})
      : super(
            reportIdModel: ReportIdModel(
          midTermAssessmentId: 9,
          mockTermAssessmentId: 13,
          midYearId: 11,
          mockExam: 15,
        ));

  @override
  void onError(error) {}

  @override
  // TODO: implement examList1
  List<TermDetailsModel> get term1List1 {
    final list = newReports
        .map((element) {
          final model = TermDetailsModel(
            subjectName: element.subjectName,
        teacherId: element.midtrmYr2Trm1TchrId?.toInt(),
        teacherName: element.midtrmYr2Trm1TchrNm,
        attendance: element.presentPercentageYr2Tr1,
        subjectPercentage: element.midtrmYr2Trm1?.toString(),
        gpa: element.midtrmYr2Trm1Gpa,
        subjectGrade: element.midtrmYr2Trm1Gd,
      );
      return model;
    }).toList();
    // .where((element) => element.isValid)
    // .toList();
    return list;
  }

  @override
  // TODO: implement examList2
  List<TermDetailsModel> get term1List2 {
    final list = newReports
        .map((element) {
          final model = TermDetailsModel(
            subjectName: element.subjectName,
        teacherId: element.midyrYr2Tr1TchrId?.toInt(),
        teacherName: element.midyrYr2Tr1TchrNm,
        attendance: element.presentPercentageYr2Tr1,
        subjectPercentage: element.midyrYr2Tr1?.toString(),
        gpa: element.midyrYr2Tr1Gpa,
        subjectGrade: element.midyrYr2Tr1Gd,
      );
      return model;
    }).toList();
    // .where((element) => element.isValid)
    // .toList();

    return list;
  }

  @override
  // TODO: implement examList3
  List<TermDetailsModel> get term2List1 {
    final list = newReports
        .map((element) {
          final model = TermDetailsModel(
            subjectName: element.subjectName,
        teacherId: element.midtrmYr2Trm2TchrId?.toInt(),
        teacherName: element.midtrmYr2Trm2TchrNm,
        attendance: element.presentPercentageYr2Tr2,
        subjectPercentage: element.midtrmYr2Trm2?.toString(),
        gpa: element.midtrmYr2Trm2Gpa,
        subjectGrade: element.midtrmYr2Trm2Gd,
      );
      return model;
    }).toList();
    // .where((element) => element.isValid)
    // .toList();

    return list;
  }

  @override
  // TODO: implement examList4
  List<TermDetailsModel> get term2List2 {
    final list = newReports
        .map((element) {
          final model = TermDetailsModel(
            subjectName: element.subjectName,
        teacherId: element.mockexYr2Tr2TchrId?.toInt(),
        teacherName: element.mockexYr2Tr2TchrNm,
        attendance: element.presentPercentageYr2Tr2,
        subjectPercentage: element.mockexYr2Tr2?.toString(),
        gpa: element.mockexYr2Tr2Gpa?.toString(),
        subjectGrade: element.mockexYr2Tr2Gd,
      );
      return model;
    }).toList();
    // .where((element) => element.isValid)
    // .toList();

    return list;
  }
}
