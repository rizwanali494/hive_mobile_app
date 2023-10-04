import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository_impl.dart';
import 'package:hive_mobile/features/news_feed/repositories/poll_repository.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';

class NewsFeedVM extends BaseApiVM<AnnouncementPostModel>
    with BaseExceptionController {
  final apiService = GetIt.instance.get<ApiService>();

  late NewsFeedRepository newsFeedRepo;

  @override
  Future<List<AnnouncementPostModel>> fetchInitialItems() async {
    var list = await newsFeedRepo.getInitialNewsFeed(limit: limit);
    return list;
  }

  @override
  Future<List<AnnouncementPostModel>> fetchNextItems() async {
    var list = await newsFeedRepo.getNextNewsFeed(limit: limit, offSet: offSet);
    return list;
  }

  @override
  void setRepoInstance() {
    newsFeedRepo = NewsFeedRepositoryImpl(apiService: apiService);
  }

  @override
  void sortByRecentOrder() {
    items.sortByRecentOrder(
        getDateAdded: (item) =>
            DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now());
  }

  PollRepository pollRepository = PollRepository();

  Future<void> selectPoll(Polls poll,
      {required AnnouncementPostModel model}) async {
    final now = DateTime.now();
    if (model.expiryDate?.toDatetime.isBefore(now) ?? false) {
      UtilFunctions.showToast(msg: "Poll Has Expired");
      return;
    }

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

    int modelIndex = items.indexOf(model);
    if (modelIndex >= 0) {
      items[modelIndex] = model;
    }

    notifyListeners();

    try {
      await pollRepository.selectPoll(poll.id ?? 0);
      await localService.deleteAndPut(model, model.id ?? 0);
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      int previousIndex = items.indexOf(previous);
      if (previousIndex >= 0) {
        items[previousIndex] = previous;
        localService.put(previous);
      }
      notifyListeners();
      localService.put(previous);
      log("Something went wrong");
      UtilFunctions.showToast();
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

  Future<void> dislikePost(AnnouncementPostModel model) async {
    var previous = model.copyWith();
    if (model.isDisliked ?? false) {
      model.dislikes = (model.dislikes ?? 1) - 1;
      model.isDisliked = false;
      int indexOf = items.indexOf(model);
      items[indexOf] = model;
    } else {
      model.dislikes = (model.dislikes ?? 0) + 1;
      model.isDisliked = true;
      if (model.isLiked ?? false) {
        model.isLiked = false;
        model.likes = (model.likes ?? 1) - 1;
      }
      int indexOf = items.indexOf(model);
      items[indexOf] = model;
    }
    notifyListeners();
    try {
      await newsFeedRepo.disLikePost(model.id ?? 0);
    } catch (e) {
      UtilFunctions.showToast();
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
      }
      handleException(e);
      int previousIndex = items.indexOf(previous);
      if (previousIndex >= 0) {
        items[previousIndex] = previous;
        localService.put(previous);
      }
      notifyListeners();
      localService.put(previous);
    }
    // int indexOf = items.indexOf(model);
    // items[indexOf] = model;
    // notifyListeners();
  }

  Future<void> likePost(AnnouncementPostModel model) async {
    var previous = model.copyWith();
    if (model.isLiked ?? false) {
      model.likes = (model.likes ?? 1) - 1;
      model.isLiked = false;
      int indexOf = items.indexOf(model);
      items[indexOf] = model;
    } else {
      model.isLiked = true;
      model.likes = (model.likes ?? 0) + 1;
      if (model.isDisliked ?? false) {
        model.isDisliked = false;
        model.dislikes = (model.dislikes ?? 1) - 1;
      }
      int indexOf = items.indexOf(model);
      items[indexOf] = model;
    }
    notifyListeners();
    try {
      await newsFeedRepo.likePost(model.id ?? 0);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
      }
      await Future.delayed(Duration(milliseconds: 500));
      handleException(e);
      int previousIndex = items.indexOf(previous);
      if (previousIndex >= 0) {
        items[previousIndex] = previous;
        localService.put(previous);
      }
      notifyListeners();
      localService.put(previous);
    }
  }
}
