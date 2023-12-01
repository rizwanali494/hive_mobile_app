import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/web_socket_services/web_socket_service.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_vm.dart';
import 'package:hive_mobile/features/notification/repositories/notification_repository.dart';
import 'package:hive_mobile/features/notification/view_models/notification_actions.dart';
import 'package:provider/provider.dart';

class NotificationScreenVM extends BaseApiVM<NotificationModel> {
  @override
  Future<List<NotificationModel>> fetchInitialItems() async {
    var list =
        await notificationRepository.getInitialNotificationList(limit: limit);
    setCount();
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
      if (event != null) {
        Future.delayed(Duration(seconds: 5)).then((value) => refreshList());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    notificationListener?.cancel();
    super.dispose();
  }

  int unreadCount = 0;

  @override
  Future<void> refreshList() async {
    await super.refreshList().then((value) => setCount());
    if (scrollController.hasClients) {
      final topValue = scrollController.position.minScrollExtent;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scrollController.animateTo(topValue,
            duration: Duration(milliseconds: 600), curve: Curves.linear);
      });
    }
    // setCount();
  }

  void setCount() {
    unreadCount = items.where((element) {
      log("ID : ${element.id} ${element.isRead}");
      return !(element.isRead ?? false);
    }).length;
    log("MEssage unread count :: ${unreadCount}");
    notifyListeners();
  }

  void resetCount() {
    unreadCount = 0;
    notifyListeners();
  }

  void updateModel(NotificationModel model) {
    int index = items.indexOf(model);
    log("Notification model ::: $index");
    if (index > -1) {
      items[index] = model;
    }
    // notifyListeners();
  }

  void performAction(BuildContext context, NotificationModel model) {
    // notificationActions["ACTIVITY"]?..performAction(context, model.id ?? 0);
    notificationActions[model.attachedObjectType]
      ?..performAction(context, model.attachedObjectId ?? 0);
    // notificationActions[model.attachedObjectType]?..performAction(context);
  }

  Map<String, NotificationAction> notificationActions = {
    _NotificationTypes.activity: ActivityAction(),
    _NotificationTypes.announcement_post: AnnouncementPostAction(),
    _NotificationTypes.university_application: UniversityApplicationAction(),
  };
}

class _NotificationTypes {
  static String activity = "ACTIVITY";
  static String external_grade = "EXTERNAL_GRADE";
  static String university_application = "UNIVERSITY_APPLICATION";
  static String announcement_post = "ANNOUNCEMENT_POST";
}
