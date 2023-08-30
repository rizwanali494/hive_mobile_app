import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class SessionNotesRepo {
  late ApiService apiService;

  SessionNotesRepo({required this.apiService});

  Future<List<SessionNoteModel>> getInitialSessionNotes({int? limit});

  Future<List<SessionNoteModel>> getNextSessionNotes({int? offSet, int? limit});
}

class SessionNotesRepositoryImpl extends SessionNotesRepo {
  SessionNotesRepositoryImpl(
      {required super.apiService, required this.endPoint});

  final String endPoint;

  @override
  Future<List<SessionNoteModel>> getInitialSessionNotes({int? limit}) async {
    log(endPoint.withLimit(limit));
    var response = await apiService.get(
      url: endPoint.withLimit(limit),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => SessionNoteModel.fromJson(e)).toList();
  }


  @override
  Future<List<SessionNoteModel>> getNextSessionNotes(
      {int? offSet, int? limit}) async {
    var response = await apiService.get(
      url: endPoint.withLimit(limit).withOffSet(offSet),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => SessionNoteModel.fromJson(e)).toList();
  }
}
