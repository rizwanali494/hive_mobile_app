import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/announcement_post_model.dart';
import 'package:hive_mobile/app/models/pigination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository_impl.dart';

class NewsFeedVM extends ChangeNotifier {
  bool _isLoading = true;
  ScrollController _scrollController = ScrollController();
  GetIt getIt = GetIt.instance;
  static const _limit = 10;
  List<AnnouncementPostModel> announcements = [];
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
      var list = await newsFeedRepository.getInitialNewsFeed(limit: _limit);
      if (list.length < _limit) {
        paginationController.toggleLastPage();
      }
      announcements.addAll(list);
      addScrollListener();
      toggleLoading();
    } catch (e) {}
  }

  Future<void> getNextNewsFeed() async {
    try {
      isGettingMore();
      var list = await newsFeedRepository.getNextNewsFeed(
        limit: _limit,
        offSet: paginationController.offset,
      );
      announcements.addAll(list);
      if (list.length < _limit) {
        isLastPage();
      }
      paginationController.setOffset(paginationController.offset + list.length);
      isGettingMore();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> refreshNewsFeed() async {
    try {
      toggleValues();
      var list = await newsFeedRepository.getInitialNewsFeed(limit: _limit);
      if (list.length < _limit) {
        isLastPage();
      }
      announcements = list;
      paginationController.setOffset(list.length);
      // announcements = [...list, ...announcements].toSet().toList();
    } catch (e) {}
    notifyListeners();
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

  void toggleValues() {
    isLastPage();
    // isGettingMore();
  }

  void isLastPage() {
    paginationController.toggleLastPage();
  }

  void isGettingMore() {
    paginationController.toggleIsGettingMore();
  }
}
