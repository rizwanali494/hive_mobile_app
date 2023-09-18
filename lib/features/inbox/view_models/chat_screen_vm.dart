import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/message_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/models/pagination_state_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/features/calender/utils/extensions.dart';
import 'package:hive_mobile/features/inbox/repositories/message_repository.dart';
import 'package:hive_mobile/features/inbox/view_models/date_message_class.dart';
import 'package:isar/isar.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';

import 'date_message_class.dart';

class ChatScreenVM extends ChangeNotifier {
  int receiverId;
  List<MessageModel> messages = [];

  final apiService = GetIt.instance.get<ApiService>();
  late MessageRepository messageRepository;
  late RevPaginationController paginationController;
  final controller =
      ScrollController(initialScrollOffset: 0.7, keepScrollOffset: true);

  ChatScreenVM({required this.receiverId}) {
    messageRepository = MessageRepositoryImpl(apiService: apiService);
    paginationController =
        RevPaginationController(controller: controller, onScroll: onScroll);
    getMessages();
  }

  Future<void> onScroll() async {
    paginationController.toggleIsGettingMore(true);
    await Future.delayed(Duration(milliseconds: 500));
    messages = [
      ...List.filled(
          10,
          MessageModel(
              content: DateTime.now().toString(),
              dateAdded: DateTime.now().toString())),
      ...messages
    ];
    notifyListeners();
    paginationController.toggleIsGettingMore(false);
    if (messages.length > 100) {
      paginationController.toggleLastPage(true);
    }
  }

  void addScrollListener() {
    paginationController.addListener();
  }

  final localService = LocalService<MessageModel>();
  UiState uiState = UiState.loading();

  Future<void> getMessages() async {
    final request = () async {
      var latestMessages =
          await messageRepository.getMessages(receiverId: receiverId);
      messages.addAll(latestMessages);
    };
    await performRequest(request: request);
    log("messages ---- ${messages.length}");
    uiState = UiState.loaded();
    notifyListeners();
    // await Future.delayed(Duration(seconds: 1));
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          controller.jumpTo(controller.position.maxScrollExtent),
        });
    addScrollListener();
    // scrollToMax();
  }

  Future<void> performRequest({required Function request}) async {
    await request();
  }

  Future<List<MessageModel>> getLocalMessages() async {
    var list = await localService
        .query()
        .filter()
        .receiverEqualTo(receiverId)
        .findAll();
    return list;
  }

  bool scrollCheck = false;

  void scrollToMax() {
    controller.jumpTo(controller.position.maxScrollExtent);
    // controller.animateTo(controller.position.maxScrollExtent, duration: Duration(seconds: 5), curve: Curves.easeIn);
  }

  DateTime? messageDate;

  String? getDate(MessageModel model) {
    final date = model.dateAdded?.toDatetime;
    log("date : ${date}");
    bool isSameDay = (messageDate?.isSameDay(date ?? DateTime.now()) ?? false);
    log("is Same : pre : ${messageDate} Date :  ${date}  ${isSameDay}");
    if (isSameDay) {
      return date?.formattedDate();
    }
    messageDate = date;
    return null;
  }

  List<DateMessage> messageData() {
    final list = <DateMessage>[];
    for (final element in messages) {
      final mDate =
      (DateTime.tryParse(element.dateAdded ?? "") ?? DateTime.now())
          .formattedDate();
      if (!list.contains(DateMessage.Data(mDate))) {
        list.add(DateMessage.Data(mDate));
      }
      list.add(DateMessage.Message(element));
    }
    return list;
  }


}

class RevPaginationController {
  late ScrollController _scrollController;
  int _offset = 10;
  late Function onScroll;
  bool _isGettingMore = false;
  bool isLastPage = false;
  PaginationState state = PaginationState.Loaded();

  int get offset => _offset;

  RevPaginationController(
      {required ScrollController controller, required this.onScroll}) {
    _scrollController = controller;
  }

  void addListener() {
    _scrollController.addListener(() {
      final nextPageTrigger = 20 + _scrollController.position.minScrollExtent;
      if (_scrollController.position.pixels < nextPageTrigger) {
        if (_isGettingMore || isLastPage) {
          return;
        }
        onScroll();
      }
    });
  }

  void resetOffset() {
    _offset = 0;
  }

  void setOffset(int value) {
    _offset = value;
  }

  void toggleLastPage([bool? value]) {
    isLastPage = value ?? !isLastPage;
  }

  void toggleIsGettingMore([bool? value]) {
    _isGettingMore = value ?? !_isGettingMore;
  }

  bool get isGettingMore {
    return _isGettingMore;
  }

  void removeListener() {
    _scrollController.removeListener(() {});
  }

}
