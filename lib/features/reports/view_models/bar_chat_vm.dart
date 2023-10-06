import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';
import 'package:hive_mobile/features/reports/view_models/report_id_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartVM  {
  BuildContext context;
  List<BarSeries<ReportModel, String>> barSeries1 = [];
  List<BarSeries<ReportModel, String>> barSeries2 = [];
  List<AssessmentInfoVM> assessments = [];

  BarChartVM({required this.context,required this.assessments}) {
    log("Bar 1");
   barSeries1 =  setBarSeries(assessments.map((e) => e.assessment1).toList());
    log("Bar 2");
   barSeries2 =  setBarSeries(assessments.map((e) => e.assessment2).toList());
   log("message : bar series 1: ${barSeries1.length}");
   log("message : bar series 1: ${barSeries2.length}");

  }

  List<BarSeries<ReportModel, String>> setBarSeries( List<ReportModel?> list ) {
    List<BarSeries<ReportModel, String>> barSeries = [];
    for (int index = 0;index<list.length;index++) {
      final value = list[index];
      log("gpa : ${value?.gpa}");
      if (value != null) {
        BarSeries<ReportModel, String> series = BarSeries<ReportModel, String>(
          dataSource: [value],
          spacing: 0.2,
          color: colors[index],
          borderRadius: BorderRadius.horizontal(
            left: (value.gpa??0) < 0?Radius.circular(12.r):Radius.zero,
            right: (value.gpa??0) > 0?Radius.circular(12.r):Radius.zero,
          ),
          xValueMapper: (datum, index) => index.toString(),
          yValueMapper: (datum, index) => datum.gpa,
        );
        barSeries.add(series);
      }
    }
    log("message : bar series 1: ${barSeries.length}");
    return barSeries;
  }

  late final styles = Theme.of(context).extension<AppTheme>()!;
  late Map<int, Color> colors = {
    0: styles.denimBlue,
    1: styles.gravel,
    2: styles.darkOrange,
    3: styles.paleOrange,
  };
}
