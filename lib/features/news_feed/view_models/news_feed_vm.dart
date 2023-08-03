import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
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

class NewsFeedVM extends ChangeNotifier {
  bool _isLoading = true;
  ScrollController _scrollController = ScrollController();
  GetIt getIt = GetIt.instance;
  static const _limit = 10;
  List<AnnouncementPostModel> announcements = [];
  late PaginationController paginationController;
  late ApiService apiService;
  late NewsFeedRepository newsFeedRepository;

  Future<void> inItValues() async {
    apiService = getIt.get<ApiService>();
    newsFeedRepository = NewsFeedRepositoryImpl(apiService: apiService);
    paginationController = PaginationController(
      controller: _scrollController,
      onScroll: getNextNewsFeed,
    );
    setIsarInstance();
    pollRepository = PollRepository();
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
      await saveLocally(list);
      addScrollListener();
      toggleLoading();
    } catch (e) {
      log(e.toString());
    }
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

  @override
  void dispose() {
    isar?.close();
    super.dispose();
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
    try {
      await newsFeedRepository.likePost(model.id ?? 0);
      var fetchedModel = await fetchAnnouncementPost(model.id ?? 0);
      int indexOf = announcements.indexOf(model);
      announcements[indexOf] = fetchedModel;
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
      }
      // TODO
    }
    notifyListeners();
  }

  Future<void> dislikePost(AnnouncementPostModel model) async {
    try {
      await newsFeedRepository.disLikePost(model.id ?? 0);
      var fetchedModel = await fetchAnnouncementPost(model.id ?? 0);
      int indexOf = announcements.indexOf(model);
      announcements[indexOf] = fetchedModel;
    } on Exception catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
      }
    }
    notifyListeners();
  }
}
