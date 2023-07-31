import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/pigination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository_impl.dart';

class NewsFeedVM extends ChangeNotifier {
  bool _isLoading = true;
  ScrollController _scrollController = ScrollController();
  GetIt getIt = GetIt.instance;
  static const limit = 10;

  late PaginationController paginationController;
  late ApiService apiService;
  late NewsFeedRepository newsFeedRepository;

  void inItValues() {
    apiService = getIt.get<ApiService>();
    newsFeedRepository = NewsFeedRepositoryImpl(apiService: apiService);
    paginationController = PaginationController(
      controller: _scrollController,
      onScroll: getNextNewsFeed,
    );
  }

  NewsFeedVM() {
    inItValues();
    getInitialNewsFeed();
  }

  Future<void> getInitialNewsFeed() async {
    try {
      var list = await newsFeedRepository.getInitialNewsFeed(limit: limit);
      toggleLoading();
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        print(e.response.statusCode);
      }
    }
    addScrollListener();
  }

  bool _isGettingMore = false;

  Future<void> getNextNewsFeed() async {
    if (_isGettingMore) {
      return;
    }
    log(paginationController.offset.toString());
    try {
      _isGettingMore = true;
      var list = await newsFeedRepository.getNextNewsFeed(
        limit: limit,
        offSet: paginationController.offset,
      );
      paginationController.setOffset =
          paginationController.offset + list.length;
      log("The list length is ${list.length}");
      _isGettingMore = false;
      notifyListeners();
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log(e.response.statusCode.toString());
      }
      log(e.toString());
    }
  }

  Future<void> refreshNewsFeed() async {
    resetOffset();
    return;
  }

  bool get isLoading => _isLoading;

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  ScrollController get scrollController => _scrollController;

  void addScrollListener() {
    paginationController.addListener();
  }

  void resetOffset() {
    paginationController.resetOffset();
  }
}
