import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
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
    var localList = await getPostFromLocalStorage();
    announcements.addAll(localList);
    if (localList.isNotEmpty) {
      notifyListeners();
    }
    try {
      // throw "something went wrong";
      var list = await newsFeedRepository.getInitialNewsFeed(limit: _limit);
      if (list.length < _limit) {
        paginationController?.toggleLastPage();
      }
      announcements.addAll(list);
      announcements = announcements.toSet().toList();
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
      var list = await newsFeedRepository.getInitialNewsFeed(limit: _limit);
      if (list.length < _limit) {
        isLastPage();
      }
      announcements = list;
      saveLocally(list);
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
    if (announcements.isEmpty) {
      _hasError = true;
    }
    _isLoading = false;
    paginationController?.toggleIsGettingMore(false);
    setLastPageFalse();
    // announcements = [];
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

  void isLastPage() {
    paginationController?.toggleLastPage();
  }

  void isGettingMore() {
    paginationController?.toggleIsGettingMore();
  }

  Isar? isar;

  Future<void> setIsarInstance() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [AnnouncementPostModelSchema],
        directory: dir.path,
      );
    } catch (e) {
      log("Isar instance not initialized error : $e");
    }
  }

  Future<List<AnnouncementPostModel>> getPostFromLocalStorage() async {
    List<AnnouncementPostModel> list = [];
    if (isar == null) {
      await setIsarInstance();
    }
    var collection = isar?.collection<AnnouncementPostModel>();
    try {
      list = await collection?.where(distinct: true).sortByIdDesc().findAll() ??
          [];
      list.forEach((element) {
        log(element.id.toString());
      });
      log("local list length : ${list.length}");
    } catch (e) {
      log("Data not fetched from local storage error:$e");
    }
    return list;
  }

  Future<void> saveLocally(List<AnnouncementPostModel> objects) async {
    if (isar == null) {
      await setIsarInstance();
    }
    try {
      var collection = isar!.collection<AnnouncementPostModel>();
      await isar?.writeTxn(
        () => collection.where().deleteAll(),
      );
      log("saving object : ${objects.length}");
      await isar?.writeTxn(
        () => collection.putAll(objects),
      );
    } catch (e) {
      log("Data not locally error: $e");
    }
    return;
  }

  Future<void> updateLocal(AnnouncementPostModel object) async {
    if (isar == null) {
      await setIsarInstance();
    }
    try {
      var collection = isar!.collection<AnnouncementPostModel>();
      var obj = await collection.get(object.id ?? -1);
      if (obj != null) {
        await isar?.writeTxn(
          () => collection.put(object),
        );
      }
    } catch (e) {
      log("Data not locally error: $e");
    }
    return;
  }

  late PollRepository pollRepository;

  Future<void> selectPoll(Polls poll,
      {required AnnouncementPostModel model}) async {
    if (poll.isSelected ?? false) {
      return;
    }

    var previous = model.copyWith();

    var selectedList =
        model.polls?.where((element) => element.isSelected ?? false);
    if (selectedList?.isNotEmpty ?? false) {
      var selectedElement = selectedList!.first;
      selectedElement.selectors = (selectedElement.selectors ?? -1) - 1;
    }

    poll.isSelected = true;
    poll.selectors = (poll.selectors ?? 0) + 1;

    var pollIndex = model.polls?.indexOf(poll);
    if (pollIndex != null && pollIndex >= 0) {
      model.polls![pollIndex] = poll;
    }

    for (var element in model.polls ?? <Polls>[]) {
      if (element.id != poll.id) {
        element.isSelected = false;
      }
    }

    int modelIndex = announcements.indexOf(model);
    if (modelIndex >= 0) {
      announcements[modelIndex] = model;
    }

    notifyListeners();

    try {
      await pollRepository.selectPoll(poll.id ?? 0);
      await updateLocal(model);
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      int previousIndex = announcements.indexOf(previous);
      if (previousIndex >= 0) {
        announcements[previousIndex] = previous;
        updateLocal(previous);
      }
      notifyListeners();
      updateLocal(previous);
      log("Something went wrong");
      if (e is HTTPStatusCodeException) {
        log(e.response.statusCode.toString());
      }
    }

    notifyListeners();
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
