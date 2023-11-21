
import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/models/pagination_state_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/view_models/base_listview_vm.dart';
import 'package:hive_mobile/app/services/base_request_service/base_request_services.dart';

abstract class BaseApiVM<T> extends ChangeNotifier with BaseRequestHandler,BaseExceptionController {
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


    final onError = (  error ){
      handleException(error);
    };

    await performRequest(request: request,onErrorOccurred: onError);
    notifyListeners();
  }

  Future<void> getNextItems() async {
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

  bool errorShown = false;

  void displayError() {}

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
      {required Function request, Function( dynamic error )? onErrorOccurred}) async {
    try {
      await request();
    } catch (e) {
      onError();
      onErrorOccurred?.call(e);
    }
    //   if (e is HTTPStatusCodeException) {
    //     log("Error occurred : ${e.response.body}");
    //     log("Error occurred : ${e.response.statusCode}");
    //   }
    //   onError();
    //   log("Error occurred : $e");
    //   log("Error occurred : ${e.runtimeType}");
    //   displayError();
    // }
  }

  BaseListViewVM<T> get listViewVM {
    return BaseListViewVM<T>(
        items: items,
        uiState: uiState,
        refreshList: refreshList,
        scrollController: scrollController,
        itemCount: listCount);
  }
}
