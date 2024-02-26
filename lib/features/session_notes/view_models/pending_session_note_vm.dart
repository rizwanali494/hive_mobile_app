import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/features/session_notes/view_models/ack_session_note_vm.dart';
import 'package:hive_mobile/features/session_notes/view_models/base_session_note_controller.dart';

class PendingSessionNoteVM extends BaseSessionNoteVM {
  PendingSessionNoteVM()
      : super(endPoint: ApiEndpoints.sessionNote.withPendingState);


  @override
  Future<void> setSessionNote(
      {required SessionNoteModel model,
      required String state,
      required ACKSessionNoteVM ackSessionNoteVM}) async {
    var previousModel = model.copyWith();
    model.state = state;
    items.remove(model);
    notifyListeners();
    var body = {"state": state.toUpperCase()};
    try {
      // await Future.delayed(Duration(seconds: 3));
      // throw "some";
      await sessionNotesRepo.ackSessionNode(id: model.id ?? 0, body: body);
      await localService.put(model);
      ackSessionNoteVM.setSSNote(model);
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

  @override
  Future<List<SessionNoteModel>> fetchLocalList() async {
    var list = await localService.findAll();
    return list.where((element) => element.isPending).toList();
  }
}
