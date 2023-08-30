import 'package:hive_mobile/app/models/data/session_note_model.dart';

class SessionNoteWidgetVM {
  final SessionNoteModel model;

  SessionNoteWidgetVM({required this.model});

  String get title => model.subject ?? "";

  String get content => model.content ?? "";
}
