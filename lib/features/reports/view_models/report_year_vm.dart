import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/report_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';
import 'package:hive_mobile/features/reports/view_models/assessment_info_vm.dart';

class ReportYearVM extends ChangeNotifier {
  final reportIds = [1, 3, 5, 19, 9, 11, 13, 15];
  final year1Ids = [1, 3, 5, 19];
  final year2Ids = [9, 11, 13, 15];
  final midTermIds = [1, 9];
  final midYear = [3, 11];
  final mockTerm = [5, 13];
  final mockExam = [19, 15];

  ReportYearVM() {
    getAllReports();
  }

  final apiService = GetIt.instance.get<ApiService>();
  late final repo = ReportRepository(apiService: apiService);

  List<ReportModel> allReports = [];
  UiState uiState = UiState.loading();

  bool get isLoading {
    return uiState.isLoading;
  }

  List<ReportModel> get year1Reports {
    return allReports
        .where((element) => year1Ids.contains(element.assessmentId))
        .toList();
  }

  List<ReportModel> get year2Reports {
    return allReports
        .where((element) => year2Ids.contains(element.assessmentId))
        .toList();
  }

  List<ReportModel> get midYearReports {
    return allReports
        .where((element) => midYear.contains(element.assessmentId))
        .toList();
  }

  List<ReportModel> get midTermReports {
    return allReports
        .where((element) => midTermIds.contains(element.assessmentId))
        .toList();
  }

  List<ReportModel> get mockExamReports {
    return allReports
        .where((element) => mockExam.contains(element.assessmentId))
        .toList();
  }

  List<ReportModel> get mockTermReports {
    return allReports
        .where((element) => mockTerm.contains(element.assessmentId))
        .toList();
  }

  Future<void> getAllReports() async {
    try {
      final list = await repo.getReports(ids: reportIds);
      allReports = list;
      uiState = UiState.loaded();
    } catch (e) {
      log("Something went wrong : ${e.toString()}");
      uiState = UiState.error();
    }
    notifyListeners();
  }

  late AssessmentInfoVM assessmentInfoVM;

  void sortItems() {
    final list1 = allReports
        .where((element) => year1Ids.contains(element.assessmentId))
        .toList();
    final list2 = allReports
        .where((element) => year2Ids.contains(element.assessmentId))
        .toList();
  }


  String get examType1 {
    return "Mid Term Assessment";
  }

  String get examType2 {
    return "Mid Year Exam";
  }

  List<String> subjectNames(List<ReportModel> reports) {
    Set<String> list = {};
    for (final element in reports) {
      final name = element.subjectName;
      if (name != null) {
        list.add(name);
      }
    }
    return list.toList();
  }

  List<String> get year1Subjects {
    final list = allReports.where((element) => element.isYear1);
    return subjectNames(list.toList());
  }

  List<String> get year2Subjects {
    final list = allReports.where((element) => element.isYear2);
    return subjectNames(list.toList());
  }

  Future<void> onRefresh() async {
    await getAllReports();
    return;
  }
}
