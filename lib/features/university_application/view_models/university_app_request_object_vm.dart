import 'package:hive_mobile/features/university_application/view_models/request_vm.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:hive_mobile/features/university_application/repositories/university_application_repo.dart';

class UniversityAppRequestObjectVM extends UniAppRequestVM {

  UniversityAppRequestObjectVM({UniversityApplicationModel? model})
      : super(model: model) {
    isObjectLoading = false;
  }

  @override
  void initValues() {
    repository = UniversityApplicationRepoImpl(apiService: apiService);
    if (model == null) {
      getUniversities();
      return;
    }
    setModelValues();
  }

  UniversityModel? selectedUniversity;
}
