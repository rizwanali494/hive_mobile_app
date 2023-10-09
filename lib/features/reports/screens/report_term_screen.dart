import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/report_line_chart.dart';
import 'package:hive_mobile/features/reports/screens/report_subjects_table.dart';
import 'package:hive_mobile/features/reports/screens/report_bar_chart.dart';
import 'package:hive_mobile/features/reports/view_models/bar_chat_vm.dart';
import 'package:hive_mobile/features/reports/view_models/line_chat_vm.dart';
import 'package:hive_mobile/features/reports/widgets/term_toggle_widget.dart';
import 'package:hive_mobile/features/reports/screens/year_row_widget.dart';
import 'package:hive_mobile/features/reports/view_models/report_table_vm.dart';
import 'package:hive_mobile/features/reports/view_models/report_widget_vm.dart';
import 'package:hive_mobile/features/reports/view_models/term_details_vm.dart';

class ReportTermScreen extends StatefulWidget {
  final TermDetailsVM provider;

  const ReportTermScreen({super.key, required this.provider});

  @override
  State<ReportTermScreen> createState() => _ReportTermScreenState();
}

class _ReportTermScreenState extends State<ReportTermScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.provider;
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.selectTerm(0);
                },
                child: TermToggleWidget(
                  isSelected: controller.selectedTerm == 0,
                  text: 'Term 1',
                ),
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.selectTerm(1);
                },
                child: TermToggleWidget(
                  isSelected: controller.selectedTerm == 1,
                  text: 'Term 2',
                ),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        if (controller.assessments.isEmpty)
          Expanded(
            child: Center(
                child: Text(
              AppStrings.noDataFound,
              style: styles.inter12w700,
            )),
          )
        else
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ReportSubjectsTable(
                    reportTableVM: ReportTableVM(
                      termDetails: controller.assessments,
                      model: controller.assessmentSummary,
                    ),
                  ),
                  ReportLineChart(
                    controller: LineChartVM(termDetails: controller.assessments),
                  ),
                  30.verticalSpace,
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.w,
                        ),
                        child: Text(
                          "CGPA",
                          style: styles.inter8w400,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            YearRowWidget(
                                context: context,
                                color: styles.skyBlue,
                                text: "${controller.examType1}"),
                            YearRowWidget(
                                context: context,
                                color: styles.darkOrange,
                                text: "${controller.examType2}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  Divider(
                    thickness: 0.5,
                    color: styles.black.withOpacity(0.5),
                  ),
                  33.verticalSpace,
                  ReportBarChart(
                      context: context,
                      data: [],
                      data2: [],
                      styles: styles,
                      examsCount: 2,
                      controller: BarChartVM(
                        assessments: controller.assessments,
                        context: context,
                        examType1: controller.examType1,
                        examType2: controller.examType2,
                      ),
                      term: 2),
                ],
              ),
            ),
          ),
      ],
    );
  }

}
