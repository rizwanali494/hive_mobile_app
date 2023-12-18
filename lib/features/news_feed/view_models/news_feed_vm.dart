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
  String? get apiEventType => "ANNOUNCEMENT_POST";

  late Map<String, Function(int id, {dynamic data})> apiEventSubActions = {
    "LIKE": updateLikesDislikes,
    "DISLIKE": updateLikesDislikes,
    "SELECT_POLL": updatePoll,
  };

  @override
  void handleApiEvent(dynamic data) {
    log("Announcement Post API Event is ${data}");
    final eventData = jsonDecode(data);
    String? action = eventData["action"];
    final extraData = eventData["extra"] ?? {};
    final objectId = eventData["id"] ?? 0;
    if (apiEventSubActions[action] == null) {
      apiEventBaseActions[action]?..call(objectId);
      return;
    }
    apiEventSubActions[action]?..call(objectId, data: extraData);
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

// void updateDislikes(int id, {required int likes}) {
//   final index = items.indexWhere((element) => element.id == id);
//   if (index > -1) {
//     items[index] = items[index].copyWith(likes: likes);
//     notifyListeners();
//   }
// }
}
