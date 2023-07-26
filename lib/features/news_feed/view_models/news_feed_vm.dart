import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_fields_expands_extension.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';

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
