import 'package:flutter/material.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/features/activities/screens/activities_screen.dart';
import 'package:hive_mobile/features/calender/screens/calendar_screen.dart';
import 'package:hive_mobile/features/external_grading/screens/external_grading_screen.dart';
import 'package:hive_mobile/features/home/screens/news_feed/screens/news_feed_screen.dart';
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
    debugPrint("${bottomKey.currentState?.context.size.toString()} bottom key");
    closeDrawer();
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
  final GlobalKey<ScaffoldState> bottomKey = GlobalKey();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeDrawer();
  }

  void setDrawerIndex() {}

  final drawerIcons = [
    SvgIcons.activities,
    SvgIcons.calender,
    SvgIcons.myServices,
    SvgIcons.clock,
    SvgIcons.externalGrading,
    SvgIcons.universityApplication,
  ];

  final drawerActionNames = [
    AppStrings.activities,
    AppStrings.calendar,
    AppStrings.myServices,
    AppStrings.sessionNote,
    AppStrings.externalGrading,
    AppStrings.universityApplication,
  ];
  Widget? currentDrawerWidget;

  List<Widget> drawerWidgets = [
    ActivitiesScreen(),
    CalendarScreen(),
    MyServicesScreen(),
    SessionNotesScreen(),
    ExternalGradingScreen(),
    UniversityApplicationScreen(),
  ];

  void setDrawerWidget(int index) {
    _currentIndex = -1;
    currentDrawerWidget = drawerWidgets[index];
    notifyListeners();
  }

  void setBottomNavWidget(int index, BuildContext context) {
    currentDrawerWidget = null;
    debugPrint("$index");
    _currentIndex = index;
    notifyListeners();
    debugPrint("$_currentIndex");
    notifyListeners();
  }
}
