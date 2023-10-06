import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/bar_chart_widget.dart';
import 'package:hive_mobile/features/reports/screens/reports_screen.dart';
import 'package:hive_mobile/features/reports/view_models/bar_chat_vm.dart';
import 'package:hive_mobile/features/reports/widgets/term_divider_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportBarWidget extends StatelessWidget {
  final BarChartVM controller;


  const ReportBarWidget({
    super.key,
    required this.context,
    required this.data,
    required this.data2,
    required this.styles,
    required this.examsCount,
    required this.term, required this.controller,
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "heading",
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
                            child: SfCartesianChart(
                              borderWidth: 0.2,
                              borderColor: Colors.black,
                              plotAreaBorderWidth: 0,
                              primaryXAxis: CategoryAxis(
                                isVisible: false,
                              ),
                              primaryYAxis: NumericAxis(
                                minimum: -2,
                                labelStyle: styles.inter8w400,
                                majorTickLines: MajorTickLines(size: 0),
                                plotOffset: 0,
                                // maximumLabelWidth: 0,
                                borderColor: Colors.amber,
                                majorGridLines: MajorGridLines(
                                    dashArray: [1, 2], width: 1, color: styles.black),
                                maximum: 6,
                                interval: 2,
                              ),
                              series: <ChartSeries<ReportModel, String>>[
                                ...controller.barSeries1
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 150.h,
                            // width: 150.h,
                            child: SfCartesianChart(
                              borderWidth: 0.2,
                              borderColor: Colors.black,
                              plotAreaBorderWidth: 0,
                              primaryXAxis: CategoryAxis(
                                isVisible: false,
                              ),
                              primaryYAxis: NumericAxis(
                                minimum: -2,
                                labelStyle: styles.inter8w400,
                                majorTickLines: MajorTickLines(size: 0),
                                plotOffset: 0,
                                // maximumLabelWidth: 0,
                                borderColor: Colors.amber,
                                majorGridLines: MajorGridLines(
                                    dashArray: [1, 2], width: 1, color: styles.black),
                                maximum: 6,
                                interval: 2,
                              ),
                              series: <ChartSeries<ReportModel, String>>[
                                ...controller.barSeries2
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
