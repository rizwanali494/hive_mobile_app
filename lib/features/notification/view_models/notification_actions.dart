import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/navigation/router.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/activities/screens/activity_details_screen.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_id_vm.dart';
import 'package:hive_mobile/features/news_feed/screens/news_feed_screen.dart';
import 'package:hive_mobile/features/university_application/screens/university_app_request_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/university_app_request_object_vm.dart';
import 'package:hive_mobile/features/university_application/view_models/university_application_id_vm.dart';

abstract class NotificationAction {
  Future<void> performAction(BuildContext context, int id);
}

class AnnouncementPostAction extends NotificationAction {
  AnnouncementPostAction();

  @override
  Future<void> performAction(BuildContext context, int id) async {
    UtilFunctions.showToast(msg: "Announcement Post notification Clicked");
  }
}

class ActivityAction extends NotificationAction {
  ActivityAction();

  @override
  Future<void> performAction(BuildContext context, int id) async {
    context.push(
      ActivityDetailScreen.route,
      extra: {
        "controller": ActivityDetailIdVM(id),
      },
    );
  }
}

class UniversityApplicationAction extends NotificationAction {
  UniversityApplicationAction();

  @override
  Future<void> performAction(BuildContext context, int id) async {
    final provider = UniversityAppRequestIdVM(objectId: id);
    context.push(
      UniversitySelectionScreen.route,
      extra: {
        "provider": provider,
      },
    );
  }
}
