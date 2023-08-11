import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/inbox/repositories/inbox_repository.dart';
import 'package:hive_mobile/features/notification/repositories/notification_repository.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NotificationScreenVM extends ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  bool isLoadingMore = false;
  static const _limit = 10;
  late PaginationController _paginationController;
  late NotificationRepository inboxRepository;
  ScrollController scrollController = ScrollController();
  ApiService apiService = GetIt.instance.get<ApiService>();
  List<NotificationModel> notificationList = [];
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
      onScroll: getNextNotificationList,
    );
    inboxRepository = NotificationRepositoryImpl(apiService: apiService);
    setIsarInstance();
    getInitialNotificationList();
  }

  Future<void> getInitialNotificationList() async {
    _isLoading = true;
    notifyListeners();
    final request = () async {
      var list =
          await inboxRepository.getInitialNotificationList(limit: _limit);
      for (var value in list) {
        log("${value.id}");
      }
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      } else {
        _paginationController
            .setOffset((_paginationController.offset) + list.length);
      }
      notificationList.addAll(list);
      notificationList = notificationList.toSet().toList();
      _paginationController.addListener();
      return;
    };
    await performRequest(request: request);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getNextNotificationList() async {
    _paginationController.toggleIsGettingMore(true);
    notifyListeners();
    final request = () async {
      var list = await inboxRepository.getNextNotificationList(
          limit: _limit, offSet: _paginationController.offset);

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
    await performRequest(request: request);
    notifyListeners();
  }

  Future<void> refreshNotificationList() async {
    final request = () async {
      _hasError = false;
      _paginationController.toggleIsGettingMore(false);
      _paginationController.toggleLastPage(false);
      var list =
          await inboxRepository.getInitialNotificationList(limit: _limit);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      } else {
        _paginationController
            .setOffset((_paginationController.offset) + list.length);
      }
      notificationList = list;
      addScrollListeners();
    };
    await performRequest(request: request);
    notifyListeners();
    return;
  }

  Future<void> setIsarInstance() async {
    if (isar != null) {
      return;
    }
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.getInstance();
    } catch (e) {
      log("Isar instance not initialized error : $e");
    }
  }

  void addScrollListeners() {
    if (!scrollController.hasListeners) {
      _paginationController.addListener();
    }
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
      if (e is HTTPStatusCodeException) {
        log("Error occurred : ${e.response.body}");
        log("Error occurred : ${e.response.statusCode}");
      }

      log("Error occurred : $e");
      onError();
    }
  }

  void onError() {
    if (notificationList.isEmpty) {
      _hasError = true;
    }
    _isLoading = false;
    _paginationController.toggleIsGettingMore(false);
    _paginationController.isLastPage = false;
    _paginationController.removeListener();
    notifyListeners();
  }

  int get listCount {
    if (isGettingMore) {
      return notificationList.length + 1;
    }
    return notificationList.length;
  }
}
