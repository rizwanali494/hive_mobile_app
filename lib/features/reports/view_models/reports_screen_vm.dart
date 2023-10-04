
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';

class ReportsScreenVM extends ChangeNotifier {
  int selectedYear = 0;
  int selectedTerm = -1;


  ReportsScreenVM() {
    getValues();
  }

  void getValues() async {}

  final apiService = GetIt.instance.get<ApiService>();

  late ReportRepository reportRepository =
      ReportRepository(apiService: apiService);

  void inItValues() {}
  final PageController pageController = PageController();

  void selectYear(int value) {
    selectedYear = value;
    pageController.jumpToPage(value);
    notifyListeners();
  }
}

