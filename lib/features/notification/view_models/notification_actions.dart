import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/navigation/router.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/activities/screens/activity_details_screen.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_id_vm.dart';
import 'package:hive_mobile/features/external_grading/screens/adding_external_grade_screen.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_adding_id_vm.dart';
import 'package:hive_mobile/features/news_feed/screens/news_feed_dialog.dart';
import 'package:hive_mobile/features/news_feed/screens/news_feed_screen.dart';
import 'package:hive_mobile/features/news_feed/view_models/NeedFeedDialogVM.dart';
import 'package:hive_mobile/features/university_application/screens/university_app_request_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/university_app_request_object_vm.dart';
import 'package:hive_mobile/features/university_application/view_models/university_application_id_vm.dart';

abstract class NotificationAction {
  @nonVirtual
  void onTap(BuildContext context, NotificationModel model) {
    performAction(context, model.attachedObjectId ?? 0);
  }

  Future<void> performAction(BuildContext context, int id);
}

class AnnouncementPostAction extends NotificationAction {
  AnnouncementPostAction();

  @override
  Future<void> performAction(BuildContext context, int id) async {
    final controller = NewsFeedDialogVM(objectId: id);
    showDialog(
      builder: (context) => NewsFeedIdDialog(controller: controller),
      context: context,
    );
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

class ExternalGradeAction extends NotificationAction {
  ExternalGradeAction();

  @override
  Future<void> performAction(BuildContext context, int id) async {
    final provider = GradeAddingIdVM(objectId: id);
    context.push(
      AddExternalGradeScreen.route,
      extra: {
        "controller": provider,
      },
    );
  }
}
