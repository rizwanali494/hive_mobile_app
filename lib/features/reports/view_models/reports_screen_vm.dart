import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/reports/repository/report_repository.dart';
import 'package:hive_mobile/features/reports/screens/report_web_view.dart';

class ReportsScreenVM extends ChangeNotifier with UtilFunctions {
  int selectedYear = 0;

  ReportsScreenVM() {
    getValues();
  }

  void getValues() async {}

  final apiService = GetIt.instance.get<ApiService>();

  late ReportRepository reportRepository =
  ReportRepository(apiService: apiService);

  void inItValues() {}
  final PageController pageController = PageController(initialPage: 0);

  void selectYear(int value) {
    // if (value == selectedYear) {
    //   selectedYear = 0;
    // } else {
    //   selectedYear = value;
    // }
    selectedYear = value;
    pageController.jumpToPage(selectedYear);
    notifyListeners();
  }

  final userModel = GetIt.instance.get<UserModel>();

  Future<void> generateReportToken(BuildContext context) async {
    showLoaderDialog(context);
    try {
      final token = await reportRepository.generateReportToken();
      log("token : $token");
      context.pop();
      context.push(
        ReportWebView.route,
        extra: {
          "token": token,
        },
      );
    } catch (e) {
      context.pop();
    }
  }
}
