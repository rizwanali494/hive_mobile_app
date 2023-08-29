import 'package:hive_mobile/app/models/data/external_grade_model.dart';

class GradeInfoVM {
  final ExternalGradeModel model;

  GradeInfoVM({required this.model});

  String get degree => model.degree ?? "";

  String get subject => model.subjects?.first.name ?? "";

  String get institute => model.institutionName ?? "";

  String get grade => model.subjects?.first.grade ?? "";
}
