import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_adding_vm.dart';

class GradeAddingObjectVM extends GradeAddingVM {
  final grades = ["A*", "A", "B", "C", "D", "E"];

  String? selectedGrade = "A*";

  GradeAddingObjectVM(
      {List<String> certificates = const [], ExternalGradeModel? model})
      : super(editModel: model) {
    if (editModel == null) {
      setCertificate(certificates);
    }
  }

  @override
  void inItValues(List<String> certificates) {
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
    if (editModel != null) {
      isObjectLoading = false;
      setValues(editModel!);
    } else {
      isObjectLoading = false;
      notifyListeners();
    }
  }

}
