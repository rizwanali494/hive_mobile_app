import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/features/notification/repositories/notification_repository.dart';

class NotificationTileVM extends ChangeNotifier {
  NotificationModel model;
  final apiService = GetIt.instance.get<ApiService>();
  late final NotificationRepository repository =
      NotificationRepositoryImpl(apiService: apiService);

  NotificationTileVM({required this.model});

  String get title => model.content ?? "";

  String get trailing {
    var formattedTime = DateTime.tryParse(model.dateAdded ?? "");
    if (formattedTime == null) {
      return "a while ago";
    }
    return formattedTime.formattedDate();
  }

  Future<void> readNotification() async {
    final id = model.id ?? 0;
    await repository.readNotification(id);
  }
}
