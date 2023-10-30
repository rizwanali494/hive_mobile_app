import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/activities/repositories/activity_repo.dart';

import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';

class ActivityWidgetVM {
  ActivityModel model;

  ActivityWidgetVM({required this.model});

  String get ownerImageUrl => model.owner?.picture?.file ?? "";

  String get ownerName => model.owner?.accountData?.extra?.employeeName ?? "";

  String? get bannerImageUrl => model.banner?.file;

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
    selectionStatus.value = model.getSelection;
    activityScreenVM?.setModel(model);
    try {
      await activityRepo.submitSelection(
          id: model.id ?? 0, body: {}, state: state);
      // await localService.put(model);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("message : ${e.response.statusCode.toString()}");
        log("message : ${e.response.body.toString()}");
      }
      await Future.delayed(Duration(seconds: 1));
      UtilFunctions.showToast();
      // var index = items.indexOf(previousModel);
      // if (index > -1) {
      //   items[index] = previousModel;
      //   notifyListeners();
      //   handleException(e);
      // }
      model = previousModel;
      activityScreenVM?.setModel(model);
      model.selection = previousModel.selection?.toUpperCase();
      selectionStatus.value = model.getSelection;
    }
  }

  final apiService = GetIt.instance.get<ApiService>();

  late final ActivityRepo activityRepo =
      ActivityRepositoryImpl(apiService: apiService);

  late ValueNotifier<ActivitySelectionStatus?> selectionStatus =
      ValueNotifier(model.getSelection);
}
