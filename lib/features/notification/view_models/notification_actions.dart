import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/models/data/session_note_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';
import 'package:hive_mobile/features/activities/screens/activity_details_screen.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_id_vm.dart';
import 'package:hive_mobile/features/external_grading/screens/adding_external_grade_screen.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_adding_id_vm.dart';
import 'package:hive_mobile/features/news_feed/screens/news_feed_dialog.dart';
import 'package:hive_mobile/features/news_feed/view_models/NeedFeedDialogVM.dart';
import 'package:hive_mobile/features/session_notes/repositories/session_note_repo.dart';
import 'package:hive_mobile/features/university_application/screens/university_app_request_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/university_application_id_vm.dart';

abstract class NotificationAction with UtilFunctions {
  @nonVirtual
  void onTap(BuildContext context, NotificationModel model) {
    bool isDeleteAction = model.isDeleteAction;
    bool contentIdNull = model.attachedObjectId == null;

    if (isDeleteAction) {
      UtilFunctions.showToast(msg: deleteMessage);
      return;
    }

    if (contentIdNull) {
      UtilFunctions.showToast(msg: "Content not found");
      return;
    }

    performAction(context, model.attachedObjectId ?? 0);
  }

  Future<void> performAction(BuildContext context, int id);

  String get deleteMessage;
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

  @override
  String get deleteMessage => "The Post was deleted";
}

class ActivityAction extends NotificationAction {
  ActivityAction();

  @override
  String get deleteMessage => "The Activity was deleted";

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
  String get deleteMessage => "This University Application was deleted";

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
  String get deleteMessage => "The external grade was deleted";

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

class SessionNoteAction extends NotificationAction {
  SessionNoteAction();

  final _apiService = GetIt.instance.get<ApiService>();

  late final repo =
      SessionNotesRepositoryImpl(apiService: _apiService, endPoint: "");

  @override
  String get deleteMessage => "The Session note was deleted";

  @override
  Future<void> performAction(BuildContext context, int id) async {
    try {
      showLoaderDialog(context);
      final model = await getSessionNote(id);
      context.push(
        DescriptionScreen.route,
        extra: {
          "title": model.subject ?? "",
          "description": model.content ?? "",
        },
      );
    } catch (e) {
      UtilFunctions.showToast();
    } finally {
      context.pop();
    }
  }

  Future<SessionNoteModel> getSessionNote(int id) async {
    return repo.getNextSessionNote(id);
  }
}
