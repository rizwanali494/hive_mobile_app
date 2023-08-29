import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final _getIt = GetIt.instance;

Future<void> registerIsarInstance() async {
  final dir = await getApplicationDocumentsDirectory();
  Isar isar = await Isar.open([
    MyServicesModelSchema,
    AnnouncementPostModelSchema,
    NotificationModelSchema,
    UniversityApplicationModelSchema,
    ExternalGradeModelSchema,
    SessionNoteModelSchema,
  ], directory: dir.path, name: "My Data");
  _getIt.registerSingleton<Isar>(isar);
}
