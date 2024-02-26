import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/mixin/event_bus_mixin.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/models/pagination_state_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/base_request_service/base_request_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/services/web_socket_services/event_bus_service.dart';
import 'package:hive_mobile/app/services/web_socket_services/web_socket_service.dart';
import 'package:hive_mobile/app/view_models/base_listview_vm.dart';

abstract class BaseApiVM<T> extends ChangeNotifier
    with BaseRequestHandler, BaseExceptionController, EventBusMixin {
  UiState uiState = UiState.loading();

  bool get hasError => uiState.hasError;

  bool get isLoading => uiState.isLoading;

  bool get isGettingMore => paginationController.isGettingMore;
  IsarService<T> localService = IsarService();
  List<T> items = [];
  final limit = 10;
  final scrollController = ScrollController();
  late PaginationController paginationController;

  int get offSet => paginationController.offset;

  int get listCount {
    if (isGettingMore) {
      return items.length + 1;
    }
    return items.length;
  }

  BaseApiVM() {
    _listenToEvents();
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
    log("Getting initial Items for ${T.runtimeType}");
    uiState = UiState.loading();
    notifyListeners();
    final request = () async {
      var list = await fetchInitialItems();
      if (list.length < limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController.setOffset(list.length);
      }
      items.addAll(list);
      await localService.clearCollection();
      await saveToLocal(list);
      paginationController.addListener();
      uiState = UiState.loaded();
      return;
    };

    final onError = (error) {
      handleException(error);
    };

    await performRequest(request: request, onErrorOccurred: onError);
    notifyListeners();
  }

  Future<void> getNextItems() async {
    log("Getting next Item for ${T.runtimeType}");
    uiState = UiState.fetchingMore();
    paginationController.state = PaginationState.GettingMore();
    paginationController.toggleIsGettingMore(true);
    notifyListeners();
    final request = () async {
      var list = await fetchNextItems();
      if (list.length < limit) {
        paginationController.state = PaginationState.LastPage();
        paginationController.isLastPage = true;
      } else {
        paginationController.state = PaginationState.Loaded();
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      items.addAll(list);
      paginationController.toggleIsGettingMore(false);
      return;
    };
    await performRequest(request: request);
    uiState = UiState.loaded();
    notifyListeners();
  }

  Future<void> refreshList() async {
    final request = () async {
      uiState = UiState.refreshing();
      paginationController.state = PaginationState.Loaded();
      paginationController.toggleIsGettingMore(false);
      paginationController.toggleLastPage(false);
      paginationController.setOffset(0);
      var list = await fetchInitialItems();
      if (list.length < limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      items = list;
      saveToLocal(list);
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

  Future<void> saveToLocal(List<T> items) async {
    await localService.saveAll(items);
  }

  void addScrollListeners() {
    if (!scrollController.hasListeners) {
      paginationController.addListener();
    }
  }

  Future<void> onError() async {
    var localList = await fetchLocalList();
    items.addAll(localList);
    items = items.toSet().toList();
    sortByRecentOrder();
    if (items.isEmpty) {
      uiState = UiState.error();
    } else {
      uiState = UiState.loaded();
    }
    paginationController.state = PaginationState.Loaded();
    paginationController.toggleIsGettingMore(false);
    paginationController.isLastPage = false;
    paginationController.removeListener();
    notifyListeners();
  }

  Future<void> performRequest(
      {required Function request,
      Function(dynamic error)? onErrorOccurred}) async {
    try {
      await request();
    } catch (e) {
      onError();
      onErrorOccurred?.call(e);
    }
  }

  BaseListViewVM<T> get listViewVM {
    return BaseListViewVM<T>(
        items: items,
        uiState: uiState,
        refreshList: refreshList,
        scrollController: scrollController,
        itemCount: listCount);
  }

  //local events
  final _localEventBus = GetIt.instance.get<LocalEventBus>();
  StreamSubscription? eventStream;

  void _listenToEvents() {
    _listenToLocalEvents();
    setApiEventListener();
  }

  void _listenToLocalEvents() {

    eventStream = _localEventBus.on<T>().listen(
      (event) {
        if (event.data != null) {
          if (event.data is T) {
            updateItem(event.data);
            log("Updating event using eventBus");
          }
        }
      },
    );
  }

  //API Events
  final webSocketService = GetIt.instance.get<WebSocketService>();

  List<String>? get apiEventTypes => null;

  StreamSubscription? apiEventStream;

  void setApiEventListener() {
    apiEventStream = webSocketService.dataStream?.where((event) {
      final data = jsonDecode(event);
      String eventType = data["type"] ?? "";
      return apiEventTypes?.contains(eventType) ?? false;
    }).listen(
      (event) {
        log("GOt hit ${T.runtimeType}");
        handleApiEvent(event);
      },
    );
  }

  void handleApiEvent(dynamic data) {}

  void updateItem(T item) {
    try {
      int indexOf = items.indexOf(item);
      if (indexOf > -1) {
        items[indexOf] = item;
        notifyListeners();
        localService.put(item);
      }
    } catch (e) {
      log("Error updating : ${e.toString()}");
    }
  }

  late Map<String, Future Function(int id)> apiEventBaseActions = {
    "CREATE": addItemFromId,
    "UPDATE": updateItemFromId,
    "DELETE": deleteFromId,
  };

  Future<void> addItemFromId(int id) async {
    final item = await fetchItem(id);
    if (item != null) {
      items.insert(0, item);
      notifyListeners();
    }
  }

  Future<void> updateItemFromId(int id) async {
    final item = await fetchItem(id);
    if (item != null) {
      int indexOf = items.indexOf(item);
      if (indexOf > -1) {
        items[indexOf] = item;
        notifyListeners();
      }
    }
  }

  Future<void> deleteFromId(int id) async {}

  Future<T?> fetchItem(int id) async {
    return null;
  }

  void deleteItem() {}

  @override
  void dispose() {
    eventStream?.cancel();
    apiEventStream?.cancel();
    super.dispose();
  }
}
