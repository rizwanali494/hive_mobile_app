import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/mixin/event_bus_mixin.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/web_socket_services/event_bus_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/activities/repositories/activity_repo.dart';

import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';

abstract class ActivityDetailVM extends ChangeNotifier with EventBusMixin {
  Function(ActivityModel model)? onUpDate;

  ActivityModel model = ActivityModel();

  ActivityDetailVM({this.onUpDate}) {
    setUiState();
  }

  UiState state = UiState.loaded();

  void setUiState() {}

  String? get ownerImageUrl => model.owner?.picture?.file;

  String get ownerName => model.owner?.accountData?.extra?.employeeName ?? "";

  String? get bannerImageUrl => model.banner?.file;

  String get title => model.name ?? "";

  String get description => model.description ?? "";

  String get campusName => model.location ?? "";

  String get eventBy => model.owner?.accountData?.extra?.employeeName ?? "";

  String get peopleGoing => (model.attendingStudents ?? 0).toString();

  String get postedTime {
    var time = DateTime.tryParse(model.dateAdded ?? "") ?? DateTime.now();
    return time.formattedTime;
  }

  String get name => model.name ?? "";

  String get eventDay {
    var eventDay = DateTime.tryParse(model.date ?? "") ?? DateTime.now();
    return eventDay.dayOnly;
  }

  String get eventTime {
    var eventDay = DateTime.tryParse(model.date ?? "") ?? DateTime.now();
    return eventDay.timeOnly;
  }

  String get dateOnly {
    var eventDay = DateTime.tryParse(model.date ?? "") ?? DateTime.now();
    return eventDay.dateOnly;
  }

  String get monthOnly {
    var eventDay = DateTime.tryParse(model.date ?? "") ?? DateTime.now();
    return eventDay.monthOnlyShort;
  }

  bool isSelected(ActivitySelectionStatus? status) {
    return status == selectionStatus.value;
  }

  Future<void> setActivitySelection(
      {required String state,
      required ActivityScreenVM? activityScreenVM}) async {
    var previousModel = model.copyWith();
    model = model.copyWith(selection: state.toUpperCase());
    model.selection = state.toUpperCase();
    model.handleAttendingCount();
    selectionStatus.value = model.getSelection;
    // activityScreenVM?.setModel(model);
    publishEvent(data: model);
    notifyListeners();
    onUpDate?.call(model);
    log("Here");
    try {
      await activityRepo.submitSelection(
          id: model.id ?? 0, body: {}, state: state);
    } catch (e) {
      await Future.delayed(Duration(seconds: 1));
      UtilFunctions.showToast();
      model = previousModel;
      // activityScreenVM?.setModel(model);
      model.selection = previousModel.selection?.toUpperCase();
      selectionStatus.value = model.getSelection;
      publishEvent<ActivityModel>(data: model);
      onUpDate?.call(model);
      notifyListeners();
    }
  }

  final apiService = GetIt.instance.get<ApiService>();

  late final ActivityRepo activityRepo =
  ActivityRepositoryImpl(apiService: apiService);

  late ValueNotifier<ActivitySelectionStatus?> selectionStatus =
  ValueNotifier(model.getSelection);

  StreamSubscription? eventListener;

  final _localEventBus = GetIt.instance.get<LocalEventBus>();
  StreamSubscription? eventStream;

  void _listenToLocalEvents() {
    eventStream = _localEventBus.on<ActivityModel>().listen(
          (event) {
        log('Got Event :: ${event.runtimeType}');
        if (event.data != null) {
          if (event.data is ActivityModel) {
            if (model.id != null) {
              model = event.data;
            }
          }
        }
      },
    );
  }
}
