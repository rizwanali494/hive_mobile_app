import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';

class NotificationTileVM {
  NotificationModel model;

  NotificationTileVM({required this.model});

  String get title => "";

  String get trailing => AppStrings.time;
}
