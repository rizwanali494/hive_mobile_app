import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ReportLineChart extends StatefulWidget {
  const ReportLineChart({
    super.key,
  });

  @override
  State<ReportLineChart> createState() => _ReportLineChartState();
}

class _ReportLineChartState extends State<ReportLineChart> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final buildBorderSide =
        BorderSide(width: 0.5, color: Colors.black.withOpacity(0.2));

    return SizedBox(
      height: 200.h,
      child: Align(
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              drawVerticalLine: false,
              horizontalInterval: 2,
              getDrawingHorizontalLine: (value) => FlLine(strokeWidth: .2),
            ),
            borderData: FlBorderData(
              border: Border(
                right: BorderSide.none,
                left: buildBorderSide,
                bottom: buildBorderSide,
                top: buildBorderSide,
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: styles.skyBlue,
                barWidth: 8,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                spots: const [
                  FlSpot(0, 0),
                  FlSpot(0.5, 1.5),
                  FlSpot(1, 2),
                  FlSpot(1.5, 1),
                  FlSpot(1.9, 2),
                  FlSpot(2.4, 3),
                  FlSpot(2.9, 2),
                  FlSpot(3.2, 4),
                ],
              ),
              LineChartBarData(
                isCurved: true,
                color: styles.darkOrange,
                barWidth: 8,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                spots: const [
                  FlSpot(0, 0),
                  FlSpot(0.7, 0.5),
                  FlSpot(1, 0.7),
                  FlSpot(1.5, 0.7),
                  FlSpot(1.8, 0.7),
                  FlSpot(2, 0.9),
                  FlSpot(2.2, 0.9),
                  FlSpot(3.5, 0.9),
                  FlSpot(3.7, 4),
                ],
              ),
            ],
            minX: 0,
            maxX: 4,
            maxY: 6,
            minY: -2,
            // titlesData: FlTitlesData(
            //   leftTitles: AxisTitles(
            //     sideTitles: SideTitles(
            //       getTitlesWidget: leftTitleWidgets,
            //       showTitles: true,
            //       interval: 2,
            //     ),
            //   ),
            //   topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            //   rightTitles:
            //       AxisTitles(sideTitles: SideTitles(showTitles: false)),
            //   bottomTitles:
            //       AxisTitles(sideTitles: SideTitles(showTitles: false)),
            // ),
          ),
          swapAnimationDuration: Duration(milliseconds: 150),
          // Optional
          swapAnimationCurve: Curves.linear, // Optional
        ),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    String text = value.toInt().toString();

    return Text(text, style: styles.inter8w400, textAlign: TextAlign.center);
  }
}
