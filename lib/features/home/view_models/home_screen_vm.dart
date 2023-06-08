import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/features/home/screens/news_feed/screens/news_feed_screen.dart';

import '../../../app/constants/svg_icons.dart';

class HomeScreenVm extends ChangeNotifier {
  final List<Widget> _pages = const [
    NewsFeedScreen(),
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

  void setIndex(int index) {
    debugPrint("$index");
    _currentIndex = index;
    notifyListeners();
    debugPrint("$_currentIndex");
  }
}
