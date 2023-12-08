
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/activities/repositories/activity_repo.dart';

class ActivityScreenVM extends BaseApiVM<ActivityModel> {
  late ActivityRepo activityRepo;

  @override
  Future<List<ActivityModel>> fetchInitialItems() async {
    var list = await activityRepo.getInitialActiveActivities(limit: limit);
    return list;
  }

  @override
  Future<List<ActivityModel>> fetchNextItems() async {
    var list = await activityRepo.getNextActiveActivities(
        limit: limit, offSet: offSet);
    return list;
  }

  final apiService = GetIt.instance.get<ApiService>();

  @override
  void setRepoInstance() {
    activityRepo = ActivityRepositoryImpl(apiService: apiService);
  }

  Future<void> setActivitySelection(
      {required ActivityModel model, required String state}) async {
    var previousModel = model.copyWith();
    model.selection = state.toUpperCase();
    model.handleAttendingCount();
    var index = items.indexOf(model);
    if (index > -1) {
      items[index] = model;
    }
    notifyListeners();
    try {
      await activityRepo.submitSelection(
          id: model.id ?? 0, body: {}, state: state);
      await localService.put(model);
    } catch (e) {
      await Future.delayed(Duration(seconds: 1));
      var index = items.indexOf(previousModel);
      if (index > -1) {
        items[index] = previousModel;
        notifyListeners();
        handleException(e);
      }
    }
  }

  bool get isLoading => uiState.isLoading;

  bool get hasError => uiState.hasError;

  void setModel(ActivityModel model) {
    int indexOf = items.indexOf(model);
    if (indexOf > -1) {
      items[indexOf] = model;
      notifyListeners();
      localService.put(model);
    }
  }
}
