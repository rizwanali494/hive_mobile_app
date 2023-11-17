import 'package:hive_mobile/features/reports/view_models/report_id_model.dart';
import 'package:hive_mobile/features/reports/view_models/report_widget_vm.dart';

class ReportYear2VM extends ReportWidgetVM {
  ReportYear2VM()
      : super(
            reportIdModel: ReportIdModel(
          midTermAssessmentId: 9,
          mockTermAssessmentId: 13,
          midYearId: 11,
          mockExam: 15,
        ));

  @override
  void onError(error) {}
}
