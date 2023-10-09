import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/reports_screen.dart';
import 'package:hive_mobile/features/reports/view_models/bar_chat_vm.dart';
import 'package:hive_mobile/features/reports/widgets/bar_chat_widget.dart';
import 'package:hive_mobile/features/reports/widgets/term_divider_widget.dart';

class ReportBarChart extends StatelessWidget {
  final BarChartVM controller;

  const ReportBarChart({
    super.key,
    required this.context,
    required this.data,
    required this.data2,
    required this.styles,
    required this.examsCount,
    required this.term,
    required this.controller,
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
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                if (controller.showTermDetails)
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.examType1,
                                style: styles.inter12w500,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            11.horizontalSpace,
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 150.h,
                                // width: 150.h,
                                child: BarChartWidget(
                                  barSeries: controller.barSeries1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.examType2,
                                style: styles.inter12w500,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            11.horizontalSpace,
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 150.h,
                                // width: 150.h,
                                child: BarChartWidget(
                                  barSeries: controller.barSeries2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Align(
            alignment: Alignment.topRight,
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                for (int index = 0;
                    index < controller.subjectNames.length;
                    index++)
                  barLegendWidget(controller.subjectNames[index],
                      controller.colors[index] ?? Colors.blueAccent),
              ],
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget barLegendWidget(String text, Color color) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(right: 0.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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

final terms = [
  "Mid Term\nAssessment",
  "Mid Year\nExams",
];
