import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';

class NotificationTileVM {
  NotificationModel model;

  NotificationTileVM({required this.model});

  String get title => model.content ?? "";

  String get trailing {
    var formattedTime = DateTime.tryParse(model.dateAdded ?? "");
    if (formattedTime == null) {
      return "a while ago";
    }
    return formattedTime.notificationFormattedTime();
  }
}
