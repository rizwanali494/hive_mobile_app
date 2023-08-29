import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/features/session_notes/repositories/session_note_repo.dart';

class SessionNoteWidgetVM with ChangeNotifier {
  final String endPoint;

  List<SessionNoteModel> sessionNotes = [];
  LocalService<SessionNoteModel> localService = LocalService();

  LocalService<SessionNoteModel> isar = LocalService();
  List<SessionNoteModel> gradesList = [];
  bool _isLoading = true;
  bool _isGettingMore = false;
  bool _hasError = false;
  final _limit = 10;
  late PaginationController paginationController;
  ScrollController scrollController = ScrollController();
  final apiService = GetIt.instance.get<ApiService>();

  late SessionNotesRepo externalGradeRepo;

  SessionNoteWidgetVM({required this.endPoint}) {
    initValues();
  }

  void initValues() {
    paginationController = PaginationController(
        controller: scrollController, onScroll: getNextSessionNotes);
    externalGradeRepo =
        SessionNotesRepositoryImpl(apiService: apiService, endPoint: endPoint);
    setPaginationController();
    getInitialSessionList();
  }

  void setPaginationController() {
    if (scrollController.hasListeners) {
      return;
    }
    paginationController = PaginationController(
      controller: scrollController,
      onScroll: getNextSessionNotes,
    );
  }

  Future<void> getInitialSessionList() async {
    var localList = await isar.findAll();

    gradesList.addAll(localList);
    if (localList.isNotEmpty) {
      notifyListeners();
    }
    _isLoading = true;
    notifyListeners();
    final request = () async {
      var list = await externalGradeRepo.getInitialSessionNotes(limit: _limit);
      list.sortByRecentOrder(
        getDateAdded: (item) =>
            DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
      );
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

  Future<void> getNextSessionNotes() async {
    paginationController.toggleIsGettingMore(true);
    notifyListeners();
    final request = () async {
      var list = await externalGradeRepo.getNextSessionNotes(
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

  Future<void> refreshSessionNotes() async {
    final request = () async {
      _hasError = false;
      paginationController.toggleIsGettingMore(false);
      paginationController.toggleLastPage(false);
      var list = await externalGradeRepo.getInitialSessionNotes(limit: _limit);
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
