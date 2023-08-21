import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/my_services/repositories/my_services_repository.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ServiceScreenVM extends ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  bool isLoadingMore = false;
  static const _limit = 10;
  late PaginationController _paginationController;
  late MyServicesRepository myServicesRepository;
  ScrollController scrollController = ScrollController();
  ApiService apiService = GetIt.instance.get<ApiService>();
  List<MyServicesModel> servicesList = [];
  Isar? isar;

  bool get isLoading => _isLoading;

  bool get isGettingMore => _paginationController.isGettingMore;

  bool get hasError => _hasError;

  int get listCount {
    if (isGettingMore) {
      return servicesList.length + 1;
    }
    return servicesList.length;
  }

  ServiceScreenVM() {
    inItValues();
  }

  void inItValues() {
    _paginationController = PaginationController(
      controller: scrollController,
      onScroll: getNextServiceList,
    );
    myServicesRepository = MyServicesRepositoryImpl(apiService: apiService);
    setIsarInstance();
    getInitialServicesList();
    getServicesStatus();
  }

  Future<void> getInitialServicesList() async {
    var localList = await getServiceFromLocal();
    servicesList.addAll(localList);
    if (localList.isNotEmpty) {
      notifyListeners();
    }
    _isLoading = true;
    notifyListeners();
    final request = () async {
      var list =
          await myServicesRepository.getInitialServicesList(limit: _limit);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      }
      _paginationController.setOffset(list.length);
      servicesList.addAll(list);
      servicesList = servicesList.toSet().toList();
      await saveLocally(list);
      await getServicesStatus();
      _paginationController.addListener();
      return;
    };
    await performRequest(request: request);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getNextServiceList() async {
    log("offset : ${_paginationController.offset}");
    _paginationController.toggleIsGettingMore(true);
    notifyListeners();
    final request = () async {
      var list = await myServicesRepository.getNextServicesList(
          limit: _limit, offSet: _paginationController.offset);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      }
      _paginationController
          .setOffset((_paginationController.offset) + list.length);
      servicesList.addAll(list);
      _paginationController.toggleIsGettingMore(false);
      return;
    };
    await performRequest(request: request);
    notifyListeners();
  }

  Future<void> refreshServicesList() async {
    final request = () async {
      _hasError = false;
      _paginationController.toggleIsGettingMore(false);
      _paginationController.setOffset(0);
      _paginationController.toggleLastPage(false);
      await getServicesStatus();
      var list =
          await myServicesRepository.getInitialServicesList(limit: _limit);
      await saveLocally(list);
      if (list.length < _limit) {
        _paginationController.isLastPage = true;
      }
      _paginationController.setOffset(list.length);
      servicesList = list;
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
      if (isar == null) {
        isar = await Isar.open([MyServicesModelSchema],
            directory: dir.path, name: "My Services");
      }
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
      setServiceStatusLocally();
      log("Error occurred : $e");
      onError();
    }
  }

  void onError() {
    if (servicesList.isEmpty) {
      _hasError = true;
    }
    _isLoading = false;
    _paginationController.toggleIsGettingMore(false);
    _paginationController.isLastPage = false;
    _paginationController.removeListener();
    notifyListeners();
  }

  Future<void> saveLocally(List<MyServicesModel> objects) async {
    if (isar == null) {
      await setIsarInstance();
    }

    try {
      var collection = isar!.collection<MyServicesModel>();
      await isar?.writeTxn(
        () => collection.where().deleteAll(),
      );
      await isar?.writeTxn(
        () => collection.putAll(objects),
      );
    } catch (e) {
      log("Data not saved locally error: $e");
    }
    return;
  }

  Future<List<MyServicesModel>> getServiceFromLocal() async {
    List<MyServicesModel> list = [];
    if (isar == null) {
      await setIsarInstance();
    }
    var collection = isar?.collection<MyServicesModel>();
    try {
      list = await collection?.where(distinct: true).findAll() ?? [];
    } catch (e) {
      log("Data not fetched from local storage error:$e");
    }
    list.sortByRecentOrder(
        getDateAdded: (item) =>
            DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now());
    return list;
  }

  void setServiceStatusLocally() {
    totalApproved = servicesList
        .where(
          (element) =>
              element.state?.toLowerCase() == AppStrings.approved.toLowerCase(),
        )
        .length;
    totalPending = servicesList
        .where(
          (element) =>
              element.state?.toLowerCase() == AppStrings.pending.toLowerCase(),
        )
        .length;
    totalRejected = servicesList
        .where(
          (element) =>
              element.state?.toLowerCase() == AppStrings.rejected.toLowerCase(),
        )
        .length;
    notifyListeners();
  }

  int totalApproved = 0;
  int totalPending = 0;
  int totalRejected = 0;

  void refresh() async {
    await getServicesStatus();
    refreshServicesList();
  }

  Future<void> getServicesStatus() async {
    try {
      var map = await myServicesRepository.getServicesStatus();
      totalApproved = map[AppStrings.approved.toLowerCase()] ?? 0;
      totalPending = map[AppStrings.pending.toLowerCase()] ?? 0;
      totalRejected = map[AppStrings.rejected.toLowerCase()] ?? 0;
      notifyListeners();
    } catch (e) {
      // TODO
      setServiceStatusLocally();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    isar?.close();
    super.dispose();
  }
}
