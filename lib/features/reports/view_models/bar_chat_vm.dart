import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';
import 'package:collection/collection.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartVM {
  BuildContext context;
  List<BarSeries<ReportModel, String>> barSeries1 = [];
  List<BarSeries<ReportModel, String>> barSeries2 = [];
  List<AssessmentInfoVM> assessments = [];
  String examType1;
  String examType2;
  bool showTermDetails;

  BarChartVM(
      {required this.context,
      required this.assessments,
      required this.examType1,
      required this.examType2,
      this.showTermDetails = false}) {
    log("Bar 1");
    barSeries1 = setBarSeries(assessments.map((e) => e.assessment1).toList());
    log("Bar 2");
    barSeries2 = setBarSeries(assessments.map((e) => e.assessment2).toList());
    setSubjectName();
  }

  List<BarSeries<ReportModel, String>> setBarSeries(List<ReportModel?> list) {
    List<BarSeries<ReportModel, String>> barSeries = [];
    for (int index = 0; index < list.length; index++) {
      final value = list[index];
      if (value != null) {
        BarSeries<ReportModel, String> series = BarSeries<ReportModel, String>(
          dataSource: [value],
          spacing: 0.2,
          color: colors[index],
          borderRadius: BorderRadius.horizontal(
            left: (value.gpa ?? 0) < 0 ? Radius.circular(12.r) : Radius.zero,
            right: (value.gpa ?? 0) > 0 ? Radius.circular(12.r) : Radius.zero,
          ),
          xValueMapper: (datum, index) => index.toString(),
          yValueMapper: (datum, index) => datum.gpa,
        );
        barSeries.add(series);
      }
    }
    return barSeries;
  }

  late final styles = Theme.of(context).extension<AppTheme>()!;
  late Map<int, Color> colors = {
    0: styles.denimBlue,
    1: styles.gravel,
    2: styles.darkOrange,
    3: styles.paleOrange,
  };

  List<String> subjectNames = [];

  void setSubjectName() {
    Set<String> list = {};
    for (final element in barSeries1 + barSeries2) {
      for (var value in element.dataSource) {
        list.add(value.subjectName ?? "");
      }
    }
    log("subjects :: ${list}");
    subjectNames = list.toList();
  }
}
