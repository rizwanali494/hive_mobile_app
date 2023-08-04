import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';
import 'package:hive_mobile/app/models/pigination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository_impl.dart';
import 'package:hive_mobile/features/news_feed/repositories/poll_repository.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NewsFeedVM extends ChangeNotifier with BaseExceptionController {
  bool _isLoading = true;
  ScrollController _scrollController = ScrollController();
  GetIt getIt = GetIt.instance;
  static const _limit = 10;
  List<AnnouncementPostModel> announcements = [];
  PaginationController? paginationController;
  late ApiService apiService;
  late NewsFeedRepository newsFeedRepository;

  Future<void> inItValues() async {
    apiService = getIt.get<ApiService>();
    newsFeedRepository = NewsFeedRepositoryImpl(apiService: apiService);
    setPaginationController();
    setIsarInstance();
    pollRepository = PollRepository();
  }

  void setPaginationController() {
    if (paginationController != null) {
      return;
    }
    paginationController = PaginationController(
      controller: _scrollController,
      onScroll: getNextNewsFeed,
    );
  }

  NewsFeedVM() {
    inItValues();
    getInitialNewsFeed();
  }

  bool _hasError = false;

  bool get hasError => _hasError;

  Future<void> getInitialNewsFeed() async {
    try {
      var list = await newsFeedRepository.getInitialNewsFeed(limit: _limit);
      if (list.length < _limit) {
        paginationController?.toggleLastPage();
      }
      announcements.addAll(list);
      await saveLocally(list);
      toggleLoading();
      addScrollListener();
    } catch (e) {
      onError();
      log(e.toString());
    }
  }

  Future<void> getNextNewsFeed() async {
    try {
      // throw "Something went wrong";

      isGettingMore();
      var list = await newsFeedRepository.getNextNewsFeed(
        limit: _limit,
        offSet: paginationController?.offset,
      );
      announcements.addAll(list);
      if (list.length < _limit) {
        isLastPage();
      }
      paginationController
          ?.setOffset((paginationController?.offset ?? 0) + list.length);
      isGettingMore();
      addScrollListener();
      notifyListeners();
    } catch (e) {
      onError();
    }
  }

  bool get isGettingMoreLoading => paginationController?.isGettingMore ?? false;

  Future<void> refreshNewsFeed() async {
    try {
      setHasErrorFalse();
      setLastPageFalse();
      // toggleValues();
      var list = await newsFeedRepository.getInitialNewsFeed(limit: _limit);
      if (list.length < _limit) {
        isLastPage();
      }
      announcements = list;
      paginationController?.setOffset(list.length);
      addScrollListener();
    } catch (e) {
      onError();
    }
    notifyListeners();
    return;
  }

  void setHasErrorFalse() {
    _hasError = false;
  }

  void setLastPageFalse() {
    paginationController?.toggleLastPage(false);
  }

  void onError() {
    _hasError = true;
    _isLoading = false;
    paginationController?.toggleIsGettingMore(false);
    setLastPageFalse();
    announcements = [];
    paginationController?.removeListener();
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void toggleHasError() {
    _hasError = !_hasError;
    notifyListeners();
  }

  ScrollController get scrollController => _scrollController;

  void addScrollListener() {
    if (!_scrollController.hasListeners) {
      paginationController?.addListener();
    }
  }

  void resetOffset() {
    paginationController?.resetOffset();
  }

  void toggleValues() {
    isLastPage();
  }

  void isLastPage() {
    paginationController?.toggleLastPage();
  }

  void isGettingMore() {
    paginationController?.toggleIsGettingMore();
  }

  Isar? isar;

  Future<void> setIsarInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [AnnouncementPostModelSchema],
      directory: dir.path,
    );
  }

  Future<void> getPostFromLocalStorage() async {
    if (isar == null) {
      await setIsarInstance();
    }
    var collection = isar?.collection<AnnouncementPostModel>();
    var list = await collection?.where(distinct: true).findAll();
    log("The list found was ------- ${list?.length}");
  }

  Future<void> saveLocally(List<AnnouncementPostModel> objects) async {
    if (isar == null) {
      await setIsarInstance();
    }
    var collection = isar!.collection<AnnouncementPostModel>();
    await isar?.writeTxn(
      () => collection.putAll(objects),
    );
    // await collection!.putAll(objects);
    getPostFromLocalStorage();
  }

  late PollRepository pollRepository;

  Future<Polls> selectPoll(Polls poll,
      {required AnnouncementPostModel model}) async {
    poll.isSelected = true;
    try {
      await pollRepository.selectPoll(poll.id ?? 0);
      var fetchedModel = await fetchAnnouncementPost(model.id ?? 0);
      model = fetchedModel;
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log(e.response.statusCode.toString());
      }
    }
    notifyListeners();
    return poll;
  }

  int? selectedPollId(AnnouncementPostModel model) {
    var list = model.polls?.where((element) => element.isSelected ?? false);
    if (list?.isNotEmpty ?? false) {
      return list?.first.id;
    }
    return null;
  }

  Future<AnnouncementPostModel> fetchAnnouncementPost(int id) async {
    return await newsFeedRepository.fetchNewsFeedModel(id);
  }

  Future<void> likePost(AnnouncementPostModel model) async {
    if (model.isLiked ?? false) {
      model.likes = (model.likes ?? 1) - 1;
      model.isLiked = false;
      int indexOf = announcements.indexOf(model);
      announcements[indexOf] = model;
      notifyListeners();
      return;
    }
    try {
      await newsFeedRepository.likePost(model.id ?? 0);
      model.isLiked = true;
      model.likes = (model.likes ?? 0) + 1;
      if (model.isDisliked ?? false) {
        model.isDisliked = false;
        model.dislikes = (model.dislikes ?? 1) - 1;
      }
      int indexOf = announcements.indexOf(model);
      announcements[indexOf] = model;
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
      }
    }

    notifyListeners();
  }

  Future<void> dislikePost(AnnouncementPostModel model) async {
    if (model.isDisliked ?? false) {
      model.dislikes = (model.dislikes ?? 1) - 1;
      model.isDisliked = false;
      int indexOf = announcements.indexOf(model);
      announcements[indexOf] = model;
      notifyListeners();
      return;
    }
    try {
      await newsFeedRepository.disLikePost(model.id ?? 0);
      model.dislikes = (model.dislikes ?? 0) + 1;
      model.isDisliked = true;
      if (model.isLiked ?? false) {
        model.isLiked = false;
        model.likes = (model.likes ?? 1) - 1;
      }
      int indexOf = announcements.indexOf(model);
      announcements[indexOf] = model;
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
      }
    }
    int indexOf = announcements.indexOf(model);
    announcements[indexOf] = model;
    notifyListeners();
  }

  @override
  void dispose() {
    isar?.close();
    _scrollController.dispose();
    super.dispose();
  }
}
