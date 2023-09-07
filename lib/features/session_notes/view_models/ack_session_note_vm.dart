import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/session_notes/repositories/session_note_repo.dart';
import 'package:hive_mobile/features/session_notes/view_models/base_session_note_controller.dart';

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

  void setSSNote(SessionNoteModel model) {
    items.add(model);
    notifyListeners();
  }
}
