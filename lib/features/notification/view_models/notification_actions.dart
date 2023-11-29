import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/navigation/router.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/news_feed/screens/news_feed_screen.dart';

abstract class NotificationAction {
  Future<void> performAction(BuildContext context);
}

class AnnouncementPostAction extends NotificationAction {
  AnnouncementPostAction();

  @override
  Future<void> performAction(BuildContext context) async {
    UtilFunctions.showToast(msg: "Announcement Post notification Clicked");
  }
}
