import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';

class LineChartVM {
  LineChartBarData? lineBarsDataTerm1;

  LineChartBarData? lineBarsDataTerm2;

  LineChartVM(
      {required this.lineBarsDataTerm1, required this.lineBarsDataTerm2}) {
    // lineBarsDataTerm1 =  setData(termDetails.map((e) => e.assessment1).toList());
    // lineBarsDataTerm2 =  setData(termDetails.map((e) => e.assessment2).toList());
  }
}
