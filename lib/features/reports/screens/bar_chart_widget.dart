import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/report_line_chart.dart';
import 'package:hive_mobile/features/reports/screens/report_text_column.dart';
import 'package:hive_mobile/features/reports/screens/reports_screen.dart';
import 'package:hive_mobile/features/reports/screens/year_row_widget.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    super.key,
    required this.context,
    required this.data,
    required this.data2,
    required this.heading,
  });

  final BuildContext context;
  final List<ChartData> data;
  final List<ChartData> data2;
  final String heading;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              heading,
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
                series: <ChartSeries<ChartData, String>>[
                  BarSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(12),
                    ),
                  ),
                  BarSeries<ChartData, String>(
                    dataSource: data2,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
