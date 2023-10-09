import 'package:flutter/material.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartWidget extends StatelessWidget {
  final List<ChartSeries<ReportModel, String>> barSeries;

  const BarChartWidget({super.key, required this.barSeries});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return SfCartesianChart(
      borderWidth: 0.2,
      borderColor: Colors.black,
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        isVisible: false,
        interval: 1,
        isInversed: true,
      ),
      primaryYAxis: NumericAxis(
        minimum: -2,
        labelStyle: styles.inter8w400,
        majorTickLines: MajorTickLines(size: 0),
        plotOffset: 0,
        // maximumLabelWidth: 0,
        borderColor: Colors.amber,
        // minorGridLines: MinorGridLines(
        //
        //   dashArray: [1, 2],
        //   width: 1,
        //   color: styles.black,
        // ),
        majorGridLines:
            MajorGridLines(dashArray: [1, 2], width: 1, color: styles.black),
        maximum: 6,
        interval: 2,
      ),
      series: barSeries,
    );
  }
}
