import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/session_notes/repositories/session_note_repo.dart';

import 'ack_session_note_vm.dart';

abstract class BaseSessionNoteVM extends BaseApiVM<SessionNoteModel> {
  @override
  Future<List<SessionNoteModel>> fetchInitialItems() async {
    return await sessionNotesRepo.getInitialSessionNotes(limit: limit);
  }

  @override
  Future<List<SessionNoteModel>> fetchLocalList() async {
    var list = await localService.findAll();
    return list.where((element) => !element.isPending).toList();
  }

  @override
  Future<List<SessionNoteModel>> fetchNextItems() async {
    return await sessionNotesRepo.getNextSessionNotes(
        limit: limit, offSet: offSet);
  }

  Future<void> setSessionNote(
      {required SessionNoteModel model,
      required String state,
      required AckSessionNoteVM ackSessionNoteVM}) async {}

  final apiService = GetIt.instance.get<ApiService>();
  late SessionNotesRepo sessionNotesRepo;

  @override
  void setRepoInstance() {
    sessionNotesRepo = SessionNotesRepositoryImpl(
        apiService: apiService,
        endPoint: ApiEndpoints.sessionNote.withNotPendingState);
  }

  @override
  void sortByRecentOrder() {
    items.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
    );
  }
}

class ACKSessionNoteVM extends BaseSessionNoteVM {
  @override
  Future<List<SessionNoteModel>> fetchInitialItems() async {
    return await sessionNotesRepo.getInitialSessionNotes(limit: limit);
  }

  @override
  Future<List<SessionNoteModel>> fetchLocalList() async {
    var list = await localService.findAll();
    return list.where((element) => !element.isPending).toList();
  }

  @override
  Future<List<SessionNoteModel>> fetchNextItems() async {
    return await sessionNotesRepo.getNextSessionNotes(
        limit: limit, offSet: offSet);
  }

  final apiService = GetIt.instance.get<ApiService>();
  late SessionNotesRepo sessionNotesRepo;

  @override
  void setRepoInstance() {
    sessionNotesRepo = SessionNotesRepositoryImpl(
        apiService: apiService,
        endPoint: ApiEndpoints.sessionNote.withNotPendingState);
  }

  @override
  void sortByRecentOrder() {
    items.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
    );
  }

  @override
  Future<void> setSessionNote(
      {required SessionNoteModel model,
      required String state,
      required AckSessionNoteVM ackSessionNoteVM}) async {
    var previousModel = model.copyWith();
    model.state = state;
    items.remove(model);
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
      items.add(previousModel);
      notifyListeners();
      log("error updating session note: ${e.toString()}");
    }
  }
}
