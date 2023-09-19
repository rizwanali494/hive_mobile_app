import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/message_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/models/pagination_state_model.dart';
import 'package:hive_mobile/app/models/rev_pagination_controller.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/features/calender/utils/extensions.dart';
import 'package:hive_mobile/features/inbox/repositories/message_repository.dart';
import 'package:hive_mobile/features/inbox/view_models/date_message_class.dart';
import 'package:isar/isar.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';

import 'package:hive_mobile/features/inbox/view_models/date_message_class.dart';

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

  int offset = 0;
  final limit = 10;

  Future<void> onScroll() async {
    // return;
    final request = () async {
      paginationController.toggleIsGettingMore(true);
      var latestMessages = await messageRepository.getMessages(
          receiverId: receiverId, limit: limit, offset: offset);
      messages = [
        ...latestMessages,
        ...messages,
      ];
      messages.forEach((element) {
        log("message : ${element.id}");
      });
      offset += latestMessages.length;
      paginationController.toggleIsGettingMore(false);
      if (latestMessages.length < limit) {
        paginationController.toggleLastPage(true);
      }
    };
    await performRequest(request: request);
    setMessageSData();
  }

  void addScrollListener() {
    paginationController.addListener();
  }

  final localService = LocalService<MessageModel>();
  UiState uiState = UiState.loading();

  Future<void> getMessages() async {
    final request = () async {
      var latestMessages = await messageRepository.getMessages(
          receiverId: receiverId, limit: limit);
      offset = latestMessages.length;
      messages.addAll(latestMessages);
    };
    await performRequest(request: request);
    log("messages ---- ${messages.length}");
    uiState = UiState.loaded();
    setMessageSData();
    notifyListeners();
    // await Future.delayed(Duration(seconds: 1));
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          controller.jumpTo(controller.position.maxScrollExtent),
        });
    messages.forEach((element) {
      log("message : ${element.id}");
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

  List<DateMessage> messagesData = [];

  void setMessageSData() {
    messagesData = [];
    for (final element in messages) {
      final mDate =
          (DateTime.tryParse(element.dateAdded ?? "") ?? DateTime.now())
              .chatFormattedDate();
      if (!messagesData.contains(DateMessage.Data(mDate))) {
        messagesData.add(DateMessage.Data(mDate));
      }
      messagesData.add(DateMessage.Message(element));
    }
    notifyListeners();
  }

  List<DateMessage> get messageData {
    return messagesData;
  }

  final messageCtrl = TextEditingController();

  Future<void> sendMessage() async {
    final msg = messageCtrl.text.trim();
    if (msg.isEmpty) {
      return;
    }
    DateTime now = DateTime.now();
    final messageModel = MessageModel(
      content: msg,
      messageState: MessageState.Sending(),
      id: now.millisecondsSinceEpoch,
      dateAdded: now.toString(),
    );
    messages.add(messageModel);
    setMessageSData();
    messageCtrl.clear();
    var map = {
      "content": msg,
      "receiverId": receiverId,
    };
    try {
      var message = await messageRepository.sendMessage(map: map);
      messages.remove(messageModel);
      messages.add(message);
      setMessageSData();
    } catch (e) {
      removeMessage(messageModel);
      addMessage(messageModel.copyWith(messageState: MessageState.hasError()));
    }
    notifyListeners();
  }


  void addMessage(MessageModel model) {
    messages.add(model);
    setMessageSData();
  }

  void removeMessage(MessageModel model) {
    messages.remove(model);
    setMessageSData();
  }

  void retryMessage( MessageModel model ) async {
    removeMessage(model);
    addMessage(model.copyWith(messageState: MessageState.Sending()));
    var map = {
      "content": model.content,
      "receiver": receiverId,
    };
    try {
      var message = await messageRepository.sendMessage(map: map);
      messages.remove(model);
      messages.add(message);
      setMessageSData();
    } catch (e) {
      removeMessage(model);
      addMessage(model.copyWith(messageState: MessageState.hasError()));
    }
    notifyListeners();
  }

}
