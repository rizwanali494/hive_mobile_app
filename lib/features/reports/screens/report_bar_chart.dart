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
    required this.term,
    required this.controller,
  });

  final int term;

  @override
  Widget build(BuildContext context) {
    late final styles = Theme.of(context).extension<AppTheme>()!;

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
        ],
      ),
    );
  }

}

final terms = [
  "Mid Term\nAssessment",
  "Mid Year\nExams",
];
