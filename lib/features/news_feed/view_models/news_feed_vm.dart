import 'dart:convert';
import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/news_feed/repositories/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/repositories/news_feed_repository_impl.dart';
import 'package:collection/collection.dart';

class NewsFeedVM extends BaseApiVM<AnnouncementPostModel> {
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

  @override
  List<String>? get apiEventTypes => ["ANNOUNCEMENT_POST", "ANNOUNCEMENT_POLL"];

  late final Map<String, Map<String, Function(int id, {dynamic data})>>
      announcementSubActions = {
    "ANNOUNCEMENT_POLL": apiEventSubPollActions,
    "ANNOUNCEMENT_POST": apiEventSubPostActions,
  };

  late Map<String, Function(int id, {dynamic data})> apiEventSubPostActions = {
    "LIKE": updateLikesDislikes,
    "DISLIKE": updateLikesDislikes,
  };

  late Map<String, Function(int id, {dynamic data})> apiEventSubPollActions = {
    "SELECT_POLL": updatePoll,
    "CREATE": (id, {data}) {},
    "UPDATE": (id, {data}) {},
    "DELETE": (id, {data}) {},
  };

  @override
  void handleApiEvent(dynamic data) {
    final eventData = jsonDecode(data);
    String? action = eventData["action"];
    final extraData = eventData["extra"] ?? {};
    final objectId = eventData["id"] ?? 0;
    final type = eventData["type"] ?? "";
    final subAction = announcementSubActions[type];
    if (subAction?[action] == null) {
      apiEventBaseActions[action]?..call(objectId);
      return;
    }
    subAction?[action]?..call(objectId, data: extraData);
  }

  void updateLikesDislikes(int id, {dynamic data}) {
    final index = items.indexWhere((element) => element.id == id);
    if (index > -1) {
      final likes = data["likes"] ?? 0;
      final disLikes = data["dislikes"] ?? 0;
      items[index] = items[index].copyWith(likes: likes, dislikes: disLikes);
      notifyListeners();
    }
  }

  @override
  Future<AnnouncementPostModel?> fetchItem(int id) async {
    log("Getting event :: ${id}");
    AnnouncementPostModel? item;
    try {
      item = await newsFeedRepo.fetchNewsFeedModel(id);
    } catch (e) {}
    return item;
  }

  void updatePoll(int id, {dynamic data}) {
    log("updating");
    final int? postId = data["post"];
    if (postId != null) {
      final itemWhere =
          items.firstWhereOrNull((element) => element.id == postId);
      if (itemWhere != null) {
        final index =
            itemWhere.polls?.indexWhere((element) => element.id == id) ?? -1;
        if (index > -1) {
          int? selectors = data["selectors"] ?? 0;
          log("updating");
          itemWhere.polls?[index] =
              itemWhere.polls?[index].copyWith(selectors: selectors) ?? Polls();
          notifyListeners();
        }
      }
    }
  }

  @override
  Future<void> deleteFromId(int id) async {
    final indexWhere = items.indexWhere((element) => element.id == id);
    if (indexWhere > -1) {
      items.removeAt(indexWhere);
      notifyListeners();
      localService.deleteSingle(id);
    }
  }

  @override
  late Map<String, Future Function(int id)> apiEventBaseActions = {
    "CREATE": addItemFromId,
    "UPDATE": updateItemFromId,
    "DELETE": deleteFromId,
    "ATTEND": updateActivityAnnouncement,
    "SKEPTICAL": updateActivityAnnouncement,
    "NOT_ATTEND": updateActivityAnnouncement,
  };

  Future<void> updateActivityAnnouncement(int id) async {
    log("Update activity announcement $id");

    final announcementId =
        items.firstWhereOrNull((element) => element.event?.id == id)?.id;
    if (announcementId == null) {
      log("Update activity announcement Idd :: ${announcementId}");
      return;
    }
    log("Update activity announcement Idd :: ${announcementId}");
    final item = await fetchItem(announcementId);
    if (item != null) {
      int indexOf = items.indexOf(item);
      log("not nulll :: ${indexOf}");
      if (indexOf > -1) {
        items[indexOf] = item;
        notifyListeners();
      }
    }
  }

  @override
  void updateItem(AnnouncementPostModel item) {
    try {
      int indexOf = items.indexOf(item);
      if (indexOf > -1) {
        items[indexOf] = item;
        notifyListeners();
        localService.put(item);
        log("Found it");
      } else {
        updateEventAnnouncement(item);
      }
    } catch (e) {
      log("Error updating : ${e.toString()}");
    }
  }

  void updateEventAnnouncement(AnnouncementPostModel item) {
    final announcementId = items.firstWhereOrNull((element) {
      log("ID : ${item.event?.id}");
      if (element.event?.id == null) {
        return false;
      }
      return element.event?.id == item.event?.id;
    })?.id;
    log("local found ::: 1 ${announcementId}");

    if (announcementId == null) {
      return;
    }
    log("local found ::: 1 ${item}");
    int indexOf = items.indexWhere(
      (element) => element.id == announcementId,
    );
    if (indexOf > -1) {
      log("local found ::: $indexOf");
      items[indexOf] = items[indexOf].copyWith(event: item.event);
      localService.put(items[indexOf]);
      notifyListeners();
    }
  }

// void updateDislikes(int id, {required int likes}) {
//   final index = items.indexWhere((element) => element.id == id);
//   if (index > -1) {
//     items[index] = items[index].copyWith(likes: likes);
//     notifyListeners();
//   }
// }
}
