import 'package:flutter/cupertino.dart';

class NewsFeedVM extends ChangeNotifier {
  bool _isLoading = true;

  NewsFeedVM() {
    getNewsFeed();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
  }

  bool get isLoading => _isLoading;

  Future<void> getNewsFeed() async {
    await Future.delayed(Duration(seconds: 3));
    toggleLoading();
    notifyListeners();
  }
}
