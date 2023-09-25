import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/session_notes/repositories/session_note_repo.dart';

import 'package:hive_mobile/features/session_notes/view_models/ack_session_note_vm.dart';

abstract class BaseSessionNoteVM extends BaseApiVM<SessionNoteModel> {
  final String endPoint;

  BaseSessionNoteVM({required this.endPoint});

  @override
  Future<List<SessionNoteModel>> fetchInitialItems() async {
    return await sessionNotesRepo.getInitialSessionNotes(limit: limit);
  }

  @override
  Future<List<SessionNoteModel>> fetchLocalList();

  @override
  Future<List<SessionNoteModel>> fetchNextItems() async {
    return await sessionNotesRepo.getNextSessionNotes(
        limit: limit, offSet: offSet);
  }

  Future<void> setSessionNote(
      {required SessionNoteModel model,
      required String state,
      required ACKSessionNoteVM ackSessionNoteVM}) async {}

  final apiService = GetIt.instance.get<ApiService>();
  late SessionNotesRepo sessionNotesRepo;

  @override
  void setRepoInstance() {
    sessionNotesRepo =
        SessionNotesRepositoryImpl(apiService: apiService, endPoint: endPoint);
  }

  @override
  void sortByRecentOrder() {
    items.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
    );
  }
}


