import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/activities/repositories/activity_repo.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_vm.dart';

class ActivityDetailObjectVM extends ActivityDetailVM {
  ActivityDetailObjectVM(ActivityModel activityModel) {
    this.model = activityModel;
  }

  @override
  void setUiState() {
    state = UiState.loaded();
  }

  Future<void> getObject(int id) async {
    try {
      final model = await activityRepo.getActivity(id: id);
      this.model = model;
      state = UiState.loaded();
    } catch (e) {
      state = UiState.error();
    }
  }
}
