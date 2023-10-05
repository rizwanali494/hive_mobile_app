import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/bar_chart_widget.dart';
import 'package:hive_mobile/features/reports/screens/reports_screen.dart';
import 'package:hive_mobile/features/reports/widgets/term_divider_widget.dart';

class ReportTermWidget extends StatelessWidget {
  const ReportTermWidget({
    super.key,
    required this.context,
    required this.data,
    required this.data2,
    required this.styles,
    required this.examsCount,
    required this.term,
  });

  final BuildContext context;
  final List<ChartData> data;
  final List<ChartData> data2;
  final AppTheme styles;
  final int examsCount;
  final int term;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TermDividerWidget(styles: styles),
                RotatedBox(
                  quarterTurns: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    child: Text(
                      "Term $term",
                      style: styles.inter8w400,
                    ),
                  ),
                ),
                TermDividerWidget(styles: styles),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  ...List.generate(
                    examsCount,
                    (index) => BarChartWidget(
                        context: context,
                        data: data,
                        data2: data2,
                        heading: terms[index % terms.length]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final terms = [
  "Mid Term\nAssessment",
  "Mid Year\nExams",
];
