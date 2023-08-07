import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/inbox/repositories/inbox_repository.dart';
import 'package:isar/isar.dart';

class InboxScreenVM extends ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  bool isLoadingMore = false;
  static const _limit = 10;
  late PaginationController _paginationController;
  late InboxRepository inboxRepository;
  ScrollController scrollController = ScrollController();
  ApiService apiService = GetIt.instance.get<ApiService>();
  List inboxList = [];
  Isar? isar;

  bool get isLoading => _isLoading;

  bool get isGettingMore => _paginationController.isGettingMore;

  bool get hasError => _hasError;

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

  void addScrollListeners() {
    if (!scrollController.hasListeners) {
      _paginationController.addListener();
    }
  }

  Future<void> getInitialInboxList() async {
    final request = () async {
      var list = await inboxRepository.getInitialInboxList(limit: _limit);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      } else {
        _paginationController
            .setOffset((_paginationController.offset ?? 0) + list.length);
      }
      inboxList.addAll(list);
      return;
    };
    performRequest(request: request);
  }

  Future<void> getNextInboxList() async {
    final request = () async {
      var list = await inboxRepository.getNextInboxList(limit: _limit);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      } else {
        _paginationController
            .setOffset((_paginationController.offset ?? 0) + list.length);
      }
      inboxList.addAll(list);
      _paginationController.toggleIsGettingMore(false);
      return;
    };
    performRequest(request: request);
  }

  Future<void> refreshInbox() async {
    final request = () async {
      _hasError = false;
      _paginationController.toggleIsGettingMore(false);
      _paginationController.toggleLastPage(false);
      var list = await inboxRepository.getInitialInboxList(limit: _limit);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      } else {
        _paginationController
            .setOffset((_paginationController.offset ?? 0) + list.length);
      }
      inboxList.addAll(list);
      addScrollListeners();
    };
    performRequest(request: request);
    return;
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

  int get listCount {
    if (isGettingMore) {
      return 12;
    }
    return 11;
  }
}
