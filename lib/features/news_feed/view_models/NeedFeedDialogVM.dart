import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/news_feed/repositories/news_feed_repository.dart';
import 'package:hive_mobile/features/news_feed/repositories/news_feed_repository_impl.dart';

class NewsFeedDialogVM extends ChangeNotifier {
  UiState _uiState = UiState.loading();

  bool get isLoading => _uiState.isLoading;

  bool get hasError => _uiState.hasError;

  final _apiService = GetIt.instance.get<ApiService>();

  late final NewsFeedRepository repo =
      NewsFeedRepositoryImpl(apiService: _apiService);

  final int objectId;
  AnnouncementPostModel? model;

  NewsFeedDialogVM({required this.objectId}) {
    getNewsFeed(objectId);
  }

  Future<void> getNewsFeed(int id) async {
    _uiState = UiState.loading();
    notifyListeners();
    try {
      final object = await repo.fetchNewsFeedModel(id);
      model = object;
      _uiState = UiState.loaded();
    } catch (e) {
      _uiState = UiState.error();
    }
    notifyListeners();
  }
}
