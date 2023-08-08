import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/inbox/repositories/inbox_repository.dart';
import 'package:isar/isar.dart';

class NotificationScreenVM extends ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  bool isLoadingMore = false;
  static const _limit = 10;
  late PaginationController _paginationController;
  late InboxRepository inboxRepository;
  ScrollController scrollController = ScrollController();
  ApiService apiService = GetIt.instance.get<ApiService>();
  List notificationList = [];
  Isar? isar;

  bool get isLoading => _isLoading;

  bool get isGettingMore => _paginationController.isGettingMore;

  bool get hasError => _hasError;

  NotificationScreenVM() {
    inItValues();
  }

  void inItValues() {
    _paginationController = PaginationController(
      controller: scrollController,
      onScroll: () {},
    );
    inboxRepository = InboxRepositoryImpl(apiService: apiService);
    setIsarInstance();
  }

  Future<void> setIsarInstance() async {
    if (isar != null) {
      return;
    }
    try {
      // final dir = await getApplicationDocumentsDirectory();
      // isar = await Isar.open(
      //   [AnnouncementPostModelSchema],
      //   directory: dir.path,
      // );
    } catch (e) {
      log("Isar instance not initialized error : $e");
    }
  }

  void addScrollListeners() {
    if (!scrollController.hasListeners) {
      _paginationController.addListener();
    }
  }

  Future<void> getInitialNotificationList() async {
    final request = () async {
      var list = await inboxRepository.getInitialInboxList(limit: _limit);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      } else {
        _paginationController
            .setOffset((_paginationController.offset) + list.length);
      }
      notificationList.addAll(list);
      return;
    };
    performRequest(request: request);
  }

  Future<void> getNextNotificationList() async {
    final request = () async {
      var list = await inboxRepository.getNextInboxList(limit: _limit);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      } else {
        _paginationController
            .setOffset((_paginationController.offset) + list.length);
      }
      notificationList.addAll(list);
      _paginationController.toggleIsGettingMore(false);
      return;
    };
    performRequest(request: request);
  }

  Future<void> refreshNotificationList() async {
    final request = () async {
      _hasError = false;
      _paginationController.toggleIsGettingMore(false);
      _paginationController.toggleLastPage(false);
      var list = await inboxRepository.getInitialInboxList(limit: _limit);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      } else {
        _paginationController
            .setOffset((_paginationController.offset) + list.length);
      }
      notificationList.addAll(list);
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
    notifyListener();
  }

  int get listCount {
    if (isGettingMore) {
      return 12;
    }
    return 11;
  }
}
