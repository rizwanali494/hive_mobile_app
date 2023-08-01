import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_fields_expands_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_model.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository.dart';

class NewsFeedRepositoryImpl extends NewsFeedRepository {
  NewsFeedRepositoryImpl({required super.apiService});

  @override
  Future<List<AnnouncementPostModel>> getInitialNewsFeed({
    int? offSet,
    int? limit,
  }) async {
    List<AnnouncementPostModel> announcements = [];
    var response = await apiService.get(
      url: ApiEndpoints
          .announcementPost.withOwnerObject.withPolls.withAttachments
          .withLimit(limit),
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
  Future<List<AnnouncementPostModel>> getNextNewsFeed({
    int? offSet,
    int? limit,
  }) async {
    List<AnnouncementPostModel> announcements = [];
    log(ApiEndpoints.announcementPost.withOwnerObject.withPolls.withAttachments
        .withLimit(limit)
        .withOffSet(offSet));
    var response = await apiService.get(
      url: ApiEndpoints
          .announcementPost.withOwnerObject.withPolls.withAttachments
          .withLimit(limit)
          .withOffSet(offSet),
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
}
