import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_vm.dart';

class ActivityDetailObjectVM extends ActivityDetailVM {
  AnnouncementPostModel? announcementPostModel;

  ActivityDetailObjectVM(ActivityModel activityModel, {super.onUpDate}) {
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
