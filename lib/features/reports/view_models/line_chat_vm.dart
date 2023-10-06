import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';

class LineChartVM {
  List<AssessmentInfoVM> termDetails = [];
  LineChartBarData? lineBarsDataTerm1  ;
  LineChartBarData? lineBarsDataTerm2  ;
  LineChartVM({required this.termDetails}){
   lineBarsDataTerm1 =  setData(termDetails.map((e) => e.assessment1).toList());
   lineBarsDataTerm2 =  setData(termDetails.map((e) => e.assessment2).toList());
  }
  LineChartBarData setData( List<ReportModel?> list ) {
    List<FlSpot> spots =[];
    for( int index = 0;index<list.length;index++ ){
      final value = list[index];
      final spot = FlSpot(index.toDouble(),value?.gpa??0.0 );
      spots.add(spot);
    }
   final lineBarsDataTerm = LineChartBarData(
      isCurved: true,
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
    lineBarsDataTerm.spots.forEach((element) {
      log("line char ${element.x} ${element.y}");
    });
    return lineBarsDataTerm;
  }


}
