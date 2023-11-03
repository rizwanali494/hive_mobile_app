import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/repositories/user_repository.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/dialogs/backup_email_dialog.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/activities/screens/activities_screen.dart';
import 'package:hive_mobile/features/calender/screens/calendar_screen.dart';
import 'package:hive_mobile/features/external_grading/screens/external_grading_screen.dart';
import 'package:hive_mobile/features/news_feed/screens/news_feed_screen.dart';
import 'package:hive_mobile/features/inbox/screens/inbox_screen.dart';
import 'package:hive_mobile/features/my_services/screens/my_services_screen.dart';
import 'package:hive_mobile/features/notification/screens/notifications_screen.dart';
import 'package:hive_mobile/features/profile/screens/profile_screen.dart';
import 'package:hive_mobile/features/reports/screens/reports_screen.dart';
import 'package:hive_mobile/features/session_notes/screens/session_notes_screen.dart';
import 'package:hive_mobile/features/university_application/screens/university_application_screen.dart';

class HomeScreenVm extends ChangeNotifier {
  final List<Widget> bottomNavBarWidget = const [
    NewsFeedScreen(),
    InboxScreen(),
    NotificationScreen(),
    ReportsScreen(),
    ProfileScreen(),
  ];
  List<Widget> drawerWidgets = const [
    ActivitiesScreen(),
    CalendarScreen(),
    ReportsScreen(),
    MyServicesScreen(),
    SessionNotesScreen(),
    ExternalGradingScreen(),
    UniversityApplicationScreen(),
  ];

  bool isSelected(String icon) {
    if (_currentIndex < 0) {
      return false;
    }
    return icon == btmNavIcons[currentIndex];
  }

  final btmNavIcons = [
    SvgIcons.homeNav,
    SvgIcons.messageNav,
    SvgIcons.notificationNav,
    SvgIcons.reportNav,
    SvgIcons.profileNav,
  ];

  int _currentIndex = 0;

  Widget get currentPage {
    if (currentDrawerWidget != null) {
      return currentDrawerWidget!;
    }
    return bottomNavBarWidget[(_currentIndex) % bottomNavBarWidget.length];
  }

  int get currentIndex {
    if (_currentIndex < 0) {
      return 0;
    }
    return _currentIndex;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      scaffoldKey.currentState?.closeDrawer();
    }
  }

  void setDrawerIndex() {}

  final drawerIcons = [
    SvgIcons.activities,
    SvgIcons.calender,
    SvgIcons.reportDrawer,
    SvgIcons.myServices,
    SvgIcons.clock,
    SvgIcons.externalGrading,
    SvgIcons.universityApplication,
  ];

  final drawerActionNames = [
    AppStrings.activities,
    AppStrings.calendar,
    AppStrings.reports,
    AppStrings.myServices,
    AppStrings.sessionNote,
    AppStrings.externalGrading,
    AppStrings.universityApplication,
  ];
  Widget? currentDrawerWidget;

  void setDrawerWidget(int index) {
    closeDrawer();
    _currentIndex = -1;
    currentDrawerWidget = drawerWidgets[index];
    notifyListeners();
  }

  void setBottomNavWidget(int index, BuildContext context) {
    closeDrawer();
    currentDrawerWidget = null;
    debugPrint("$index");
    _currentIndex = index;
    notifyListeners();
    debugPrint("$_currentIndex");
    notifyListeners();
  }

  UserModel get getUserModel {
    return GetIt.instance.get<UserModel>();
  }

  final apiService = GetIt.instance.get<ApiService>();
  late final UserRepository userRepository =
      UserRepository(apiService: apiService);

  Future<void> updateBackupEmail(
      {required String email, required BuildContext context}) async {
    log("here");
    final map = {"backup_email": email};
    UtilFunctions().showLoaderDialog(context);
    try {
      final response = await userRepository.updateBackupEmail(
          body: map, id: getUserModel.id ?? 0);
      context.pop();
      showDialog(
        context: context,
        builder: (context) => const BackUpEmailDialog(),
      );
      return;
    } catch (e) {
      log("Backup email : ${e.toString()}");
    }
    context.pop();
    UtilFunctions.showToast(
        msg: "Something went wrong. Couldn't verify backup email");
  }

  void notify() {
    notifyListeners();
  }
}
