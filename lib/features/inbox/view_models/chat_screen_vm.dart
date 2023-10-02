import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/message_model.dart';
import 'package:hive_mobile/app/models/rev_pagination_controller.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/features/calender/utils/extensions.dart';
import 'package:hive_mobile/features/inbox/repositories/message_repository.dart';
import 'package:hive_mobile/features/inbox/view_models/date_message_class.dart';
import 'package:isar/isar.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';


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

  final localService = IsarService<MessageModel>();
  UiState uiState = UiState.loading();

  Future<void> getMessages() async {
    final request = () async {
      var latestMessages = await messageRepository.getMessages(
          receiverId: receiverId, limit: limit);
      offset = latestMessages.length;
      messages.addAll(latestMessages);
      saveMessagesToLocal();
    };
    final onError = () async {
      final list = await getLocalMessages();
      messages = list;
      setMessageSData();
    };
    await performRequest(request: request,onError: onError);
    uiState = UiState.loaded();
    setMessageSData();
    notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          controller.jumpTo(controller.position.maxScrollExtent),
        });
    messages.forEach((element) {
      log("message : ${element.id}");
    });
    addScrollListener();
  }

  Future<void> performRequest(
      {required Function request, Function? onError}) async {
    try {
      await request();
    } catch (e) {
      if (onError != null) {
        onError();
      }
      // TODO
    }
  }

  Future<List<MessageModel>> getLocalMessages() async {
    var list = await localService
        .query()
        .filter()
        .receiverEqualTo(receiverId)
        .findAll();
    list.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.dateAdded ?? "") ?? DateTime.now(),
    );
    return list.reversed.toList();
  }

  void saveMessagesToLocal() async {
    List<MessageModel> list = [];
    if (messages.length > 10) {
      int value = messages.length - 10;
      int length = messages.length;
      for (int i = value; i < length; i++) {
        list.add(messages[i]);
      }
    } else {
      list = messages;
    }
    await localService.clearCollection();
    localService.saveAll(list);
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
    WidgetsBinding.instance.addPostFrameCallback((_) => {
      controller.jumpTo(controller.position.maxScrollExtent),
    });
    var map = {
      "content": msg,
      "receiver": receiverId,
    };
    try {
      var message = await messageRepository.sendMessage(map: map);
      messages.remove(messageModel);
      messages.add(message);
      setMessageSData();
      saveMessagesToLocal();

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

  void retryMessage(MessageModel model) async {
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
