import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/news_feed/repositories/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/repositories/news_feed_repository_impl.dart';
import 'package:hive_mobile/features/news_feed/repositories/poll_repository.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';

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


}
