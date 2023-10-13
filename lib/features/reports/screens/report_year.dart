import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/features/reports/screens/report_bar_chart.dart';
import 'package:hive_mobile/features/reports/view_models/bar_chat_vm.dart';

class ReportYear extends StatelessWidget {
  final List<ReportModel> yearReports;

  const ReportYear({super.key, required this.yearReports});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReportBarChart(
          controller: BarChartVM(
            assessments1: yearReports
                .where((element) => element.isMidTermAssessment)
                .toList(),
            assessments2:
                yearReports.where((element) => element.isMidYearExam).toList(),
            context: context,
            showTermDetails: true,
            examType1: "Mid Term Assessment",
            examType2: "Mid Year Exam",
          ),
          term: 1,
        ),
        ReportBarChart(
          controller: BarChartVM(
            assessments1: yearReports
                .where((element) =>
                    element.isYear1 && element.isMockTermAssessment)
                .toList(),
            assessments2: yearReports
                .where((element) => element.isYear1 && element.isMockExam)
                .toList(),
            context: context,
            showTermDetails: true,
            examType1: "Mock Term Assessment",
            examType2: "Mock Exam",
          ),
          term: 2,
        ),
      ],
    );
  }
}
