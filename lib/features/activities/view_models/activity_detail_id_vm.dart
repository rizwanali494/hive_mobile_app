import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/activities/repositories/activity_repo.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_vm.dart';

class ActivityDetailIdVM extends ActivityDetailVM {
  ActivityDetailIdVM(int id) {
    getObject(id);
  }

  @override
  void setUiState() {
    state = UiState.loading();
  }

  Future<void> getObject(int id) async {
    try {
      final model = await activityRepo.getActivity(id: id);
      this.model = model;
      state = UiState.loaded();
    } catch (e) {
      log("Message ::: ${e.toString()}");
      state = UiState.error();
    }
    notifyListeners();
  }
}
