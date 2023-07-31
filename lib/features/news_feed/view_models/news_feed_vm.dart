import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/pigination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_service_impl.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository_impl.dart';

class NewsFeedVM extends ChangeNotifier {
  bool _isLoading = true;
  ScrollController _scrollController = ScrollController();
  GetIt getIt = GetIt.instance;
  late PaginationController paginationController;
  late ApiService apiService;
  late NewsFeedRepository newsFeedRepository;

  void inItValues() {
    apiService = getIt.get<ApiServiceImpl>();
    newsFeedRepository = NewsFeedRepositoryImpl(apiService: apiService);
    paginationController = PaginationController(
      controller: _scrollController,
      onScroll: getNewsFeed,
    );
  }

  NewsFeedVM() {
    inItValues();
    getInitialNewsFeed();
  }

  Future<void> getInitialNewsFeed() async {
    addScrollListener();
  }

  Future<void> getNewsFeed() async {
    toggleLoading();
    await Future.delayed(Duration(seconds: 3));
    toggleLoading();
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
