import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/features/university_application/view_models/university_application_screen_vm.dart';
import 'package:isar/isar.dart';

class PreviousApplicationVM extends BaseUniversityApplicationScreenVM {
  @override
  Future<List<UniversityApplicationModel>> fetchInitialItems(
      {required int limit}) async {
    final list = await universityApplicationRepository.getPreviousApplications(
        limit: limit);
    return list;
  }

  @override
  Future<List<UniversityApplicationModel>> fetchLocalList() async {
    final list = await isarService
        .query()
        .filter()
        .not()
        .stateEqualTo("APPROVED")
        .findAll();
    return list;
  }

  @override
  Future<List<UniversityApplicationModel>> fetchNextItems(
      {required int limit, required int offset}) async {
    final list = await universityApplicationRepository.getPreviousApplications(
        limit: limit, offSet: offset);
    return list;
  }
}
