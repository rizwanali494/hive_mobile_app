import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/reports/screens/report_subjects_table.dart';
import 'package:hive_mobile/features/reports/view_models/report_table_vm.dart';
import 'package:hive_mobile/features/reports/view_models/term_details_vm.dart';
import 'package:hive_mobile/features/reports/widgets/term_toggle_widget.dart';

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
  if( controller.termDetails.isEmpty ) {
    return Center(
      child: Text(
        AppStrings.noDataFound,
        style: styles.inter12w600,
      ),
    );
  }

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
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.selectExam(0);
                },
                child: TermToggleWidget(
                  isSelected: controller.selectedExam == 0,
                  text: controller.examType1,
                ),
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.selectExam(1);
                },
                child: TermToggleWidget(
                  isSelected: controller.selectedExam == 1,
                  text: controller.examType2,
                ),
              ),
            ),
          ],
        ),
        15.verticalSpace,
        // if (controller.assessments.isEmpty)
        //   Expanded(
        //     child: Center(
        //       child: ErrorTextWidget(
        //         onRefresh: controller.onRefresh,
        //         errorText: AppStrings.noDataFound,
        //       ),
        //     ),
        //   )
        // else
        Expanded(
          child: RefreshIndicator(
            onRefresh: controller.onRefresh,
            backgroundColor: styles.white,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  ReportSubjectsTable(
                    reportTableVM: ReportTableVM(
                      termDetails: controller.assessments,
                      terms: controller.termDetails,
                      model: controller.assessmentSummary,
                      examType: controller.selectedExamType,
                      termList: controller.termDetails,
                    ),
                  ),
                  32.verticalSpace,
                  // ReportLineChart(
                  //   controller: LineChartVM(
                  //       lineBarsDataTerm1: controller.lineBarsDataTerm1,
                  //       lineBarsDataTerm2: controller.lineBarsDataTerm2),
                  // ),
                  // 30.verticalSpace,
                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //         left: 5.w,
                  //       ),
                  //       child: Text(
                  //         "CGPA",
                  //         style: styles.inter8w400,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           YearRowWidget(
                  //               context: context,
                  //               color: styles.skyBlue,
                  //               text: "${controller.examType1}"),
                  //           YearRowWidget(
                  //               context: context,
                  //               color: styles.darkOrange,
                  //               text: "${controller.examType2}"),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // 30.verticalSpace,
                  // Divider(
                  //   thickness: 0.5,
                  //   color: styles.black.withOpacity(0.5),
                  // ),
                  // 33.verticalSpace,
                  // ReportBarChart(
                  //   controller: BarChartVM(
                  //     assessments1: controller.assessments
                  //         .map((e) => e.assessment1)
                  //         .toList(),
                  //     assessments2: controller.assessments
                  //         .map((e) => e.assessment2)
                  //         .toList(),
                  //     context: context,
                  //     examType1: controller.examType1,
                  //     examType2: controller.examType2,
                  //   ),
                  //   term: 2,
                  // ),
                  // 10.verticalSpace,
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Wrap(
                  //     runSpacing: 10,
                  //     spacing: 10,
                  //     children: [
                  //       for (int index = 0;
                  //           index < controller.subjectNames.length;
                  //           index++)
                  //         BarChartLegendWidget(
                  //             text: controller.subjectNames[index],
                  //             color: colors[index] ?? Colors.blueAccent),
                  //     ],
                  //   ),
                  // ),
                  // 10.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  late final styles = Theme.of(context).extension<AppTheme>()!;
  late Map<int, Color> colors = {
    0: styles.denimBlue,
    1: styles.gravel,
    2: styles.darkOrange,
    3: styles.paleOrange,
  };
}
