import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/features/home/screens/news_feed/screens/news_feed_screen.dart';

class HomeScreenVm extends ChangeNotifier {
  final List<Widget> _pages = const [
    NewsFeedScreen(),
  ];
  int _currentIndex = 0;

  Widget get currentPage => _pages[_currentIndex];

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
