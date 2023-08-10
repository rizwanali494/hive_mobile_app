import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository.dart';

class NewsFeedRepositoryImpl extends NewsFeedRepository {
  NewsFeedRepositoryImpl({required super.apiService});

  @override
  Future<List<AnnouncementPostModel>> getInitialNewsFeed(
      {int? offSet, int? limit}) async {
    List<AnnouncementPostModel> announcements = [];
    var response = await apiService.get(
      url: withAttachments().withLimit(limit),
    );
    var result = jsonDecode(response.body);
    List items = result["results"] ?? [];
    announcements = items
        .map<AnnouncementPostModel>(
            (item) => AnnouncementPostModel.fromJson(item))
        .toList();
    return announcements;
  }

  @override
  Future<List<AnnouncementPostModel>> getNextNewsFeed(
      {int? offSet, int? limit}) async {
    List<AnnouncementPostModel> announcements = [];
    log(withAttachments().withLimit(limit).withOffSet(offSet));
    var response = await apiService.get(
      url: withAttachments().withLimit(limit).withOffSet(offSet),
    );

    var result = jsonDecode(response.body);
    List items = result["results"] ?? [];
    announcements = items
        .map<AnnouncementPostModel>(
            (item) => AnnouncementPostModel.fromJson(item))
        .toList();
    print(announcements.length.toString());
    return announcements;
  }

  String withAttachments() => ApiEndpoints.announcementPost.withOwnerObject
      .withPolls.withAttachments.withMostRecentOrder;

  @override
  Future<AnnouncementPostModel> fetchNewsFeedModel(int id) async {
    var url = ApiEndpoints.announcementPost
        .withPostModel(id)
        .withPolls
        .withOwnerObject
        .withAttachments;
    log(url);
    var response = await apiService.get(url: url);
    var body = jsonDecode(response.body);
    return AnnouncementPostModel.fromJson(body);
  }

  @override
  Future<void> disLikePost(int id) async {
    var url = ApiEndpoints.announcementPost.withDislike(id);
    var response = await apiService.post(url: url, body: {});
    log(url);
  }

  @override
  Future<void> likePost(int id) async {
    var url = ApiEndpoints.announcementPost.withLike(id);
    log(url);
    var response = await apiService.post(url: url, body: {});
  }
}
