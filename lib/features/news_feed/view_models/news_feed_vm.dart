import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/pigination_controller.dart';

class NewsFeedVM extends ChangeNotifier {
  bool _isLoading = true;
  late PaginationController paginationController;
  ScrollController _scrollController = ScrollController();

  NewsFeedVM() {
    paginationController = PaginationController(
      controller: _scrollController,
      onScroll: getNewsFeed,
    );
    getInitialNewsFeed();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Future<void> getInitialNewsFeed() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    toggleLoading();
    addScrollListener();
  }

  Future<void> getNewsFeed() async {
    toggleLoading();
    await Future.delayed(Duration(seconds: 3));
    toggleLoading();
  }

  void addScrollListener() {
    paginationController.addListener();
  }

  ScrollController get scrollController => _scrollController;
}
