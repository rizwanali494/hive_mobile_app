import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/models/pagination_state_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/main.dart';

abstract class BaseApiVM<T> with ChangeNotifier {
  UiState uiState = UiState.loading();
  LocalService<T> localService = LocalService();
  List<T> items = [];
  final limit = 10;
  final scrollController = ScrollController();
  late PaginationController paginationController;

  bool get isGettingMore => paginationController.isGettingMore;

  int get offSet => paginationController.offset;

  int get listCount {
    if (isGettingMore) {
      return items.length + 1;
    }
    return items.length;
  }

  BaseApiVM() {
    initValues();
  }

  void initValues() {
    paginationController = PaginationController(
        controller: scrollController, onScroll: getInitialItems);
    setRepoInstance();
    setPaginationController();
    getInitialItems();
  }

  void setPaginationController() {
    if (scrollController.hasListeners) {
      return;
    }
    paginationController = PaginationController(
      controller: scrollController,
      onScroll: getNextItems,
    );
  }

  void setRepoInstance();

  void sortByRecentOrder() {}

  Future<List<T>> fetchInitialItems();

  Future<void> getInitialItems() async {
    uiState = UiState.loading();
    notifyListeners();
    final request = () async {
      var list = await fetchInitialItems();
      sortByRecentOrder();
      if (list.length < limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController.setOffset(list.length);
      }
      items.addAll(list);
      await localService.clearCollection();
      await localService.saveAll(list);
      paginationController.addListener();
      return;
    };
    await performRequest(request: request);
    var localList = await fetchLocalList();
    items.addAll(localList);
    items = items.toSet().toList();
    uiState = UiState.loaded();
    notifyListeners();
  }

  Future<void> getNextItems() async {
    paginationController.state = PaginationState.GettingMore();
    // paginationController.toggleIsGettingMore(true);
    notifyListeners();
    final request = () async {
      var list = await fetchNextItems();
      if (list.length < limit) {
        paginationController.state = PaginationState.LastPage();
        // paginationController.isLastPage = true;
      } else {
        paginationController.state = PaginationState.Loaded();
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      items.addAll(list);
      // paginationController.toggleIsGettingMore(false);
      return;
    };
    await performRequest(request: request);
    notifyListeners();
  }

  Future<void> refreshList() async {
    final request = () async {
      uiState = UiState.refreshing();
      paginationController.state = PaginationState.Loaded();
      // paginationController.toggleIsGettingMore(false);
      // paginationController.toggleLastPage(false);
      paginationController.setOffset(0);
      var list = await fetchInitialItems();
      if (list.length < limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      items = list;
      localService.saveAll(list);
      addScrollListeners();
    };
    await performRequest(request: request);
    notifyListeners();
    return;
  }

  Future<List<T>> fetchNextItems();

  Future<List<T>> fetchLocalList() async {
    return await localService.findAll();
  }

  void addScrollListeners() {
    if (!scrollController.hasListeners) {
      paginationController.addListener();
    }
  }

  bool errorShown = false;

  void displayError() {}

  void onError() {
    if (items.isEmpty) {
      uiState = UiState.error();
    } else {
      uiState = UiState.loaded();
    }
    paginationController.state = PaginationState.Loaded();
    // paginationController.toggleIsGettingMore(false);
    // paginationController.isLastPage = false;
    paginationController.removeListener();
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
      onError();
      log("Error occurred : $e");
      log("Error occurred : ${e.runtimeType}");
      displayError();
    }
  }
}
