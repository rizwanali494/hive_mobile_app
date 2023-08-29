import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/features/external_grading/external_grade_repository.dart';

class ExternalGradeVM with ChangeNotifier {
  LocalService<ExternalGradeModel> isar = LocalService();
  List<ExternalGradeModel> gradesList = [];
  bool _isLoading = true;
  bool _isGettingMore = false;
  bool _hasError = false;
  final _limit = 10;
  late PaginationController paginationController;
  ScrollController scrollController = ScrollController();
  final apiService = GetIt.instance.get<ApiService>();

  late ExternalGradesRepo externalGradeRepo;

  ExternalGradeVM() {
    initValues();
  }

  void initValues() {
    paginationController = PaginationController(
        controller: scrollController, onScroll: getNextNotificationList);
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    setPaginationController();
    getInitialNotificationList();
  }

  void setPaginationController() {
    if (scrollController.hasListeners) {
      return;
    }
    paginationController = PaginationController(
      controller: scrollController,
      onScroll: getNextNotificationList,
    );
  }

  Future<void> getInitialNotificationList() async {
    var localList = await isar.findAll();

    gradesList.addAll(localList);
    if (localList.isNotEmpty) {
      notifyListeners();
    }

    _isLoading = true;
    notifyListeners();
    final request = () async {
      var list = await externalGradeRepo.getInitialGradesList(limit: _limit);
      for (var value in list) {
        log("${value.id}");
      }
      if (list.length < _limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      gradesList.addAll(list);
      gradesList = gradesList.toSet().toList();
      await isar.saveAll(list);
      paginationController.addListener();
      return;
    };
    await performRequest(request: request);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getNextNotificationList() async {
    paginationController.toggleIsGettingMore(true);
    notifyListeners();
    final request = () async {
      var list = await externalGradeRepo.getNextGradesList(
          limit: _limit, offSet: paginationController.offset);

      if (list.length < _limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      gradesList.addAll(list);
      paginationController.toggleIsGettingMore(false);
      return;
    };
    await performRequest(request: request);
    notifyListeners();
  }

  Future<void> refreshGradesList() async {
    final request = () async {
      _hasError = false;
      paginationController.toggleIsGettingMore(false);
      paginationController.toggleLastPage(false);
      var list = await externalGradeRepo.getInitialGradesList(limit: _limit);
      if (list.length < _limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      gradesList = list;
      addScrollListeners();
    };
    await performRequest(request: request);
    notifyListeners();
    return;
  }

  void addScrollListeners() {
    if (!scrollController.hasListeners) {
      paginationController.addListener();
    }
  }

  void setLastPage([bool lastPage = true]) {
    paginationController.isLastPage = lastPage;
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

  bool get isGettingMore => paginationController.isGettingMore;

  void onError() {
    if (gradesList.isEmpty) {
      _hasError = true;
    }
    _isLoading = false;
    paginationController.toggleIsGettingMore(false);
    paginationController.isLastPage = false;
    paginationController.removeListener();
    notifyListeners();
  }

  int get listCount {
    if (isGettingMore) {
      return gradesList.length + 1;
    }
    return gradesList.length;
  }

  bool get hasError => _hasError;

  bool get isLoading => _isLoading;
}
