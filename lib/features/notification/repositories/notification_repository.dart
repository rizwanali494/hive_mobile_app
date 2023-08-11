import 'dart:convert';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class NotificationRepository {
  late ApiService apiService;

  NotificationRepository({required this.apiService});

  Future<List<NotificationModel>> getInitialNotificationList({int? limit});

  Future<List<NotificationModel>> getNextNotificationList(
      {int? offSet, int? limit});

  Future<void> readNotification();
}

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl({required super.apiService});

  @override
  Future<List<NotificationModel>> getInitialNotificationList(
      {int? limit}) async {
    var response = await apiService.get(
      url: withAttachments.withLimit(limit),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => NotificationModel.fromJson(e)).toList();
  }

  String get withAttachments =>
      ApiEndpoints.notification.withAttachments.withMostRecentOrder;

  @override
  Future<List<NotificationModel>> getNextNotificationList(
      {int? offSet, int? limit}) async {
    var response = await apiService.get(
      url: withAttachments.withLimit(limit).withOffSet(offSet),
    );
    var result = jsonDecode(response.body);
    List list = result["results"] ?? [];
    return list.map((e) => NotificationModel.fromJson(e)).toList();
  }

  @override
  Future<void> readNotification() async {}
}
