import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/web_socket_services/web_socket_service.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/notification/repositories/notification_repository.dart';
import 'package:hive_mobile/features/notification/view_models/notification_actions.dart';

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
      return !(element.isRead ?? false);
    }).length;
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
    log("message : ${model.attachedObjectType}");
    notificationActions[model.attachedObjectType]?..onTap(context, model);
  }

  Map<String, NotificationAction> notificationActions = {
    _NotificationTypes.activity: ActivityAction(),
    _NotificationTypes.announcement_post: AnnouncementPostAction(),
    _NotificationTypes.university_application: UniversityApplicationAction(),
    _NotificationTypes.external_grade: ExternalGradeAction(),
    _NotificationTypes.external_grade_subject: ExternalGradeSubjectAction(),
    _NotificationTypes.session_note: SessionNoteAction(),
    _NotificationTypes.service_request: ServiceRequestAction(),
  };
}

class _NotificationTypes {
  static String activity = "ACTIVITY";
  static String external_grade = "EXTERNAL_GRADE";
  static String external_grade_subject = "EXTERNAL_GRADE_SUBJECT";
  static String university_application = "UNIVERSITY_APPLICATION";
  static String announcement_post = "ANNOUNCEMENT_POST";
  static String session_note = "SESSION_NOTE";
  static String service_request = "SERVICE_REQUEST";
}
