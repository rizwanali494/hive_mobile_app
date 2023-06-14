import 'package:flutter/material.dart';
import 'package:hive_mobile/features/home/screens/news_feed/screens/news_feed_screen.dart';
import 'package:hive_mobile/features/notification/screens/notifications_screen.dart';
import 'package:hive_mobile/features/profile/screens/profile_screen.dart';
import 'package:hive_mobile/features/reports/screens/reports_screen.dart';

import '../../../app/constants/svg_icons.dart';

class HomeScreenVm extends ChangeNotifier {
  final List<Widget> _pages = const [
    NewsFeedScreen(),
    ReportsScreen(),
    ProfileScreen(),
  ];

  bool isSelected(String icon) {
    return icon == icons[currentIndex];
  }

  final icons = [
    SvgIcons.homeNav,
    SvgIcons.messageNav,
    SvgIcons.notificationNav,
    SvgIcons.reportNav,
    SvgIcons.profileNav,
  ];

  int _currentIndex = 0;

  Widget get currentPage => _pages[_currentIndex % _pages.length];

  int get currentIndex => _currentIndex;

  void setIndex(int index, BuildContext context) {
    debugPrint("$index");
    if (index == 2) {
      _openBottomSheet(context);
      return;
    }
    _currentIndex = index;
    notifyListeners();
    debugPrint("$_currentIndex");
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            child: const SingleChildScrollView(child: NotificationScreen()));
      },
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }
}