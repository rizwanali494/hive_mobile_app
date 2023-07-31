import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/announcement_post_model.dart';
import 'package:hive_mobile/app/services/api_services/api_service_impl.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/news_feed/news_feed_repository.dart';

class NewsFeedRepositoryImpl extends NewsFeedRepository {
  NewsFeedRepositoryImpl({required super.apiService});

  @override
  Future<List<AnnouncementPostModel>> getInitialNewsFeed() async {
    List<AnnouncementPostModel> announcements = [];
    return announcements;
  }

  @override
  Future<List<AnnouncementPostModel>> getNextNewsFeed() async {
    List<AnnouncementPostModel> announcements = [];
    return announcements;
  }
}
