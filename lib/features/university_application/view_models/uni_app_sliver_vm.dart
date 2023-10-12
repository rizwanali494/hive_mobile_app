import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';

class UniAppSliverVM {
  String title;

  final bool isLoading;
  final bool hasAll;
  final bool isGettingMore;
  final void Function() onTap;
  final List<UniversityApplicationModel> applications;

  UniAppSliverVM({
    required this.title,
    required this.isLoading,
    required this.applications,
    required this.hasAll,
    required this.onTap,
    required this.isGettingMore,
  });
}
