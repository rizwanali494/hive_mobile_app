import 'dart:async';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/web_socket_services/web_socket_service.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/notification/repositories/notification_repository.dart';

class NotificationScreenVM extends BaseApiVM<NotificationModel> {
  @override
  Future<List<NotificationModel>> fetchInitialItems() async {
    var list =
        await notificationRepository.getInitialNotificationList(limit: limit);
    return list;
  }

  @override
  Future<List<NotificationModel>> fetchNextItems() async {
    var list = await notificationRepository.getNextNotificationList(
        limit: limit, offSet: offSet);
    return list;
  }

  final apiService = GetIt.instance.get<ApiService>();
  late NotificationRepository notificationRepository;

  NotificationScreenVM() {
    setNotificationListener();
  }

  @override
  void sortByRecentOrder() {
    items.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
    );
  }

  @override
  void setRepoInstance() {
    notificationRepository = NotificationRepositoryImpl(apiService: apiService);
  }

  StreamSubscription? notificationListener;

  final webSocketService = GetIt.instance.get<WebSocketService>();

  void setNotificationListener() {
    notificationListener = webSocketService.dataStream?.listen((event) {
      log("Notification Listener ::::: ${event}");
      refreshList();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    notificationListener?.cancel();
    super.dispose();
  }
}
