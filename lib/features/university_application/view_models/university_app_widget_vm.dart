import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';

class UniversityAppWidgetVM {
  final void Function(UniversityApplicationModel model) onUpdate;

  final UniversityApplicationModel model;

  UniversityAppWidgetVM({
    required this.model,
    required this.onUpdate,
  });

  String get universityName => model.university?.name ?? "";

  String get description => model.description ?? "";

  String get comments => model.comments ?? "";

  ApplicationState get applicationState => model.getState;
}
