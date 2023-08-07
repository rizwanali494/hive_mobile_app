import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/inbox/repositories/inbox_repository.dart';

class InboxScreenVM extends ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  static const _limit = 10;
  late PaginationController _paginationController;
  late InboxRepository inboxRepository;
  ScrollController scrollController = ScrollController();
  ApiService apiService = GetIt.instance.get<ApiService>();

  bool get isLoading => _isLoading;

  InboxScreenVM() {
    inItValues();
  }

  void inItValues() {
    _paginationController = PaginationController(
      controller: scrollController,
      onScroll: () {},
    );
    inboxRepository = InboxRepositoryImpl(apiService: apiService);
  }

  void setLastPage([bool lastPage = true]) {
    _paginationController.isLastPage = lastPage;
  }

  void notifyListener() {
    notifyListeners();
  }

  Future<void> performRequest({required Function request}) async {
    try {
      await request();
    } catch (e) {
      log("Error occurred : $e");
    }
  }
}
