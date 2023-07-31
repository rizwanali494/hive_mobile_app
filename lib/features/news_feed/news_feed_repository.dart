import 'package:hive_mobile/app/models/data/announcement_post_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class NewsFeedRepository {
  ApiService apiService;

  NewsFeedRepository({required this.apiService});

  Future<List<AnnouncementPostModel>> getInitialNewsFeed();

  Future<List<AnnouncementPostModel>> getNextNewsFeed();
}