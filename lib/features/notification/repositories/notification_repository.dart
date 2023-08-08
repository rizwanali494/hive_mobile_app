import 'dart:convert';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_fields_expands_extension.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class NotificationRepository {
  late ApiService apiService;

  NotificationRepository({required this.apiService});

  Future<List> getInitialNotificationList({int? limit});

  Future<List> getNextNotificationList({int? offSet, int? limit});

  Future<void> readNotification();
}

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl({required super.apiService});

  @override
  Future<List> getInitialNotificationList({int? limit}) async {
    var response = await apiService.get(
      url: ApiEndpoints.notification.withAttachments.withLimit(limit),
    );
    var result = jsonDecode(response.body);
    List items = result["results"] ?? [];
    return Future.value([]);
  }

  @override
  Future<List> getNextNotificationList({int? offSet, int? limit}) async {
    var response = await apiService.get(
      url: ApiEndpoints.notification.withAttachments
          .withLimit(limit)
          .withOffSet(offSet),
    );
    var result = jsonDecode(response.body);

    return Future.value([]);
  }

  @override
  Future<void> readNotification() async {}
}
