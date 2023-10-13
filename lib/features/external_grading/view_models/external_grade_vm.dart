
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_repository.dart';

class ExternalGradeVM extends BaseApiVM<ExternalGradeModel> {
  late ExternalGradesRepo externalGradeRepo;

  @override
  Future<List<ExternalGradeModel>> fetchInitialItems() async {
    return await externalGradeRepo.getInitialGradesList(limit: limit);
  }

  @override
  Future<List<ExternalGradeModel>> fetchNextItems() async {
    return await externalGradeRepo.getNextGradesList(
        limit: limit, offSet: offSet);
  }

  final apiService = GetIt.instance.get<ApiService>();

  @override
  void setRepoInstance() {
    externalGradeRepo = ExternalGradeRepositoryImpl(apiService: apiService);
  }

  void updateItem(ExternalGradeModel? model) {
    if (model == null) {
      return;
    }
    var index = items.indexOf(model);
    if (index > -1) {
      items[index] = model;
      notifyListeners();
    }
  }

  bool get isLoading => uiState.isLoading;

  bool get hasError => uiState.hasError;

  List<String> get addedGrades {
    return items.map((e) => e.degree ?? "").toList();
  }

  void addExternalGrade(ExternalGradeModel? model) {
    if (model == null) {
      return;
    }
    items.add(model);
    notifyListeners();
    if (items.length < 10) {
      localService.put(model);
    }
  }

  void removeExternalGrade(ExternalGradeModel? model) async {
    if (model == null) {
      return;
    }
    items.remove(model);
    notifyListeners();
    try {
      await externalGradeRepo.deleteExternalGrade(id: model.id ?? 0);
      localService.put(model);
    } catch (e) {}
  }

  BuildContext? context;

  @override
  void displayError() {
    UtilFunctions.showToast();
  }
}
