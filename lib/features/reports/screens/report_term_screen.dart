import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/report_line_chart.dart';
import 'package:hive_mobile/features/reports/screens/report_subjects_table.dart';
import 'package:hive_mobile/features/reports/screens/report_term_widget.dart';
import 'package:hive_mobile/features/reports/screens/term_toggle_widget.dart';
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
    final provider = widget.provider;
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  provider.selectTerm(0);
                },
                child: TermToggleWidget(
                  isSelected: provider.selectedTerm == 0,
                  text: 'Term 1',
                ),
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: GestureDetector(
                onTap: () {
                  provider.selectTerm(1);
                },
                child: TermToggleWidget(
                  isSelected: provider.selectedTerm == 1,
                  text: 'Term 2',
                ),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ReportSubjectsTable(
                  reportTableVM: ReportTableVM(
                    termDetails: provider.assessments,
                    model: provider.assessmentSummary,
                  ),
                ),
                ReportLineChart(),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          YearRowWidget(
                              context: context,
                              color: styles.skyBlue,
                              text: "Year 1"),
                          52.horizontalSpace,
                          YearRowWidget(
                              context: context,
                              color: styles.darkOrange,
                              text: "Year 2"),
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
                ReportTermWidget(
                    context: context,
                    data: [],
                    data2: [],
                    styles: styles,
                    examsCount: 2,
                    term: 2),
                ReportTermWidget(
                    context: context,
                    data: [],
                    data2: [],
                    styles: styles,
                    examsCount: 2,
                    term: 2),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    barLegendWidget("Accounting", styles.denimBlue),
                    barLegendWidget("Mathematics", styles.gravel),
                    barLegendWidget("Economics", styles.yellowGreen),
                    barLegendWidget("Business", styles.paleOrange),
                  ],
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding barLegendWidget(String text, Color color) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Row(
        children: [
          Container(
            width: 6.w,
            height: 6.h,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          3.horizontalSpace,
          Text(
            text,
            style: styles.inter10w600,
          )
        ],
      ),
    );
  }
}
