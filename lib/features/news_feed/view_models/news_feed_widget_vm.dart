import 'dart:developer';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/mixin/event_bus_mixin.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/web_socket_services/event_bus_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/news_feed/repositories/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/repositories/news_feed_repository_impl.dart';
import 'package:hive_mobile/features/news_feed/repositories/poll_repository.dart';

class NewsFeedWidgetVm
    with BaseExceptionController, ChangeNotifier, EventBusMixin {
  final AnnouncementPostModel model;

  NewsFeedWidgetVm({required AnnouncementPostModel model}) : model = model;

  String get userName {
    return model.owner?.accountData?.extra?.employeeName ?? "";
  }

  String get description {
    return model.text ?? "";
  }

  String? get userImage {
    return model.owner?.picture?.file;
  }

  bool get isPost {
    return model.type == "POST";
  }

  List<String?>? get attachments {
    return model.attachments?.map((e) => e.file).toList();
  }

  String get likes {
    return (model.likes?.toInt() ?? 0).toString();
  }

  String get dislikes {
    return (model.dislikes?.toInt() ?? 0).toString();
  }

  String get postTime {
    var time = DateTime.tryParse(model.dateAdded ?? "");
    return time?.formattedTime ?? "";
  }

  List<Polls> get polls {
    return (model.polls ?? []);
  }

  double? get totalSelectors {
    return model.polls?.fold(
        0.0,
        (previousValue, element) =>
            (previousValue ?? 0) + (element.selectors ?? 0));
  }

  bool get isLiked {
    return model.isLiked ?? false;
  }

  bool get isDisliked {
    return model.isDisliked ?? false;
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
    publishEvent<AnnouncementPostModel>(data: model);
    notifyListeners();

    try {
      await pollRepository.selectPoll(poll.id ?? 0);
      // await localService.deleteAndPut(model, model.id ?? 0);
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      publishEvent<AnnouncementPostModel>(data: previous);
      notifyListeners();
      // localService.put(previous);
      log("Something went wrong");
      handleException(e);
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
      publishEvent<AnnouncementPostModel>(data: model);
    } else {
      model.dislikes = (model.dislikes ?? 0) + 1;
      model.isDisliked = true;
      if (model.isLiked ?? false) {
        model.isLiked = false;
        model.likes = (model.likes ?? 1) - 1;
      }
    }
    publishEvent<AnnouncementPostModel>(data: model);
    notifyListeners();
    try {
      await newsFeedRepo.disLikePost(model.id ?? 0);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("${e.response.statusCode}");
      }
      handleException(e);
      publishEvent<AnnouncementPostModel>(data: previous);
      notifyListeners();
    }
  }

  Future<void> likePost(AnnouncementPostModel model) async {
    var previous = model.copyWith();
    if (model.isLiked ?? false) {
      model.likes = (model.likes ?? 1) - 1;
      model.isLiked = false;
      // int indexOf = items.indexOf(model);
      // items[indexOf] = model;
    } else {
      model.isLiked = true;
      model.likes = (model.likes ?? 0) + 1;
      if (model.isDisliked ?? false) {
        model.isDisliked = false;
        model.dislikes = (model.dislikes ?? 1) - 1;
      }
    }
    publishEvent<AnnouncementPostModel>(data: model);
    notifyListeners();
    try {
      await newsFeedRepo.likePost(model.id ?? 0);
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      handleException(e);
      publishEvent<AnnouncementPostModel>(data: previous);
      notifyListeners();
    }
  }

  final _apiService = GetIt.instance.get<ApiService>();

  late NewsFeedRepository newsFeedRepo =
      NewsFeedRepositoryImpl(apiService: _apiService);
//
// bool get isEvent => model.event != null;
//
// ActivityModel get event {
//   final eventMap = model.event;
//   eventMap?["owner"] = model.owner?.toJson() ?? null;
//   final event = ActivityModel.fromJson(model.event);
//   return event;
// }
}
