import 'dart:convert';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
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
    // if( model.selection?.toLowerCase() == state.toLowerCase() ){
    //   return;
    // }
    var previousModel = model.copyWith();
    // model.selection = state.toUpperCase();
    model.handleAttendingCount(state);
    var index = items.indexOf(model);
    if (index > -1) {
      items[index] = model;
      publishEvent<AnnouncementPostModel>(
          data: AnnouncementPostModel().copyWith(
        event: model.toAnnouncement,
      ));
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
        publishEvent<AnnouncementPostModel>(
            data: AnnouncementPostModel().copyWith(
          event: previousModel.toAnnouncement,
        ));
        notifyListeners();
      }
      handleException(e);
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

  @override
  List<String>? get apiEventTypes => ["ACTIVITY"];

  @override
  void handleApiEvent(dynamic data) {
    log("Activity Post API Event is ${data}");
    final eventData = jsonDecode(data);
    String? action = eventData["action"];
    final extraData = eventData["extra"] ?? {};
    final objectId = eventData["id"] ?? 0;
    final subAction = apiSubEvent[action];
    if (subAction == null) {
      apiEventBaseActions[action]?..call(objectId);
      return;
    }
    subAction.call(objectId, data: extraData);
  }

  @override
  Future<ActivityModel?> fetchItem(int id) async {
    ActivityModel? item;
    try {
      item = await activityRepo.getActivity(id: id);
    } catch (e) {}
    return item;
  }

  @override
  Future<void> deleteFromId(int id) async {
    final indexWhere = items.indexWhere((element) => element.id == id);
    if (indexWhere > -1) {
      items.removeAt(indexWhere);
      notifyListeners();
      localService.deleteSingle(id);
    }
  }

  late Map<String, Function(int id, {Map? data})> apiSubEvent = {
    "SKEPTICAL": updateAttendingCount,
    "ATTEND": updateAttendingCount,
    "NOT_ATTEND": updateAttendingCount,
  };

  void updateAttendingCount(int id, {Map? data}) {
    final int indexWhere = items.indexWhere((element) => element.id == id);
    if (indexWhere > -1) {
      final skepCount = data?["skeptical_students"] ?? 0;
      final attendingCount = data?["attending_students"] ?? 0;
      final notAttendingCount = data?["non_attending_students"] ?? 0;
      items[indexWhere] = items[indexWhere].copyWith(
        skepticalStudents: skepCount,
        attendingStudents: attendingCount,
        nonAttendingStudents: notAttendingCount,
      );
      notifyListeners();
    }
  }
}
