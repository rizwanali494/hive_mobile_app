import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/features/session_notes/repositories/session_note_repo.dart';
import 'package:hive_mobile/features/session_notes/view_models/ack_session_note_vm.dart';

class PendingSessionNoteVM with ChangeNotifier {
  LocalService<SessionNoteModel> localService = LocalService();

  LocalService<SessionNoteModel> isar = LocalService();
  List<SessionNoteModel> sessionNotesList = [];
  bool _isLoading = true;
  bool _isGettingMore = false;
  bool _hasError = false;
  final _limit = 10;
  late PaginationController paginationController;
  ScrollController scrollController = ScrollController();
  final apiService = GetIt.instance.get<ApiService>();

  late SessionNotesRepo sessionNotesRepo;

  PendingSessionNoteVM() {
    initValues();
  }

  void initValues() {
    paginationController = PaginationController(
        controller: scrollController, onScroll: getNextSessionNotes);
    sessionNotesRepo = SessionNotesRepositoryImpl(
        apiService: apiService,
        endPoint: ApiEndpoints.sessionNote.withPendingState);
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
    var localList = await getLocalList();

    sessionNotesList.addAll(localList);
    if (localList.isNotEmpty) {
      notifyListeners();
    }
    _isLoading = true;
    notifyListeners();
    final request = () async {
      var list = await sessionNotesRepo.getInitialSessionNotes(limit: _limit);
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
      sessionNotesList.addAll(list);
      sessionNotesList = sessionNotesList.toSet().toList();
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
      var list = await sessionNotesRepo.getNextSessionNotes(
          limit: _limit, offSet: paginationController.offset);

      if (list.length < _limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      sessionNotesList.addAll(list);
      paginationController.toggleIsGettingMore(false);
      return;
    };
    await performRequest(request: request);
    notifyListeners();
  }

  Future<List<SessionNoteModel>> getLocalList() async {
    var list = await isar.findAll();
    return list.where((element) => element.isPending).toList();
  }

  Future<void> refreshSessionNotes() async {
    final request = () async {
      _hasError = false;
      paginationController.toggleIsGettingMore(false);
      paginationController.toggleLastPage(false);
      var list = await sessionNotesRepo.getInitialSessionNotes(limit: _limit);
      if (list.length < _limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController
            .setOffset((paginationController.offset) + list.length);
      }
      sessionNotesList = list;
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
    if (sessionNotesList.isEmpty) {
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
      return sessionNotesList.length + 1;
    }
    return sessionNotesList.length;
  }

  bool get hasError => _hasError;

  bool get isLoading => _isLoading;

  Future<void> setSessionNote(
      {required SessionNoteModel model,
      required String state,
      required AckSessionNoteVM ackSessionNoteVM}) async {
    var previousModel = model.copyWith();
    model.state = state;
    sessionNotesList.remove(model);
    notifyListeners();
    var body = {"state": state.toUpperCase()};
    try {
      await sessionNotesRepo.ackSessionNode(id: model.id ?? 0, body: body);
      await localService.put(model);
      ackSessionNoteVM.setSessionNote(model);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("message : ${e.response.statusCode.toString()}");
        log("message : ${e.response.body.toString()}");
      }
      log("state : ${model.state}");
      sessionNotesList.add(previousModel);
      notifyListeners();
      log("error updating session note: ${e.toString()}");
    }
  }

  void sortByRecentOrder() {
    sessionNotesList.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
    );
  }
}
