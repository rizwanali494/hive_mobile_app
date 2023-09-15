import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/message_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/local_service.dart';
import 'package:hive_mobile/features/inbox/repositories/message_repository.dart';
import 'package:isar/isar.dart';

class ChatScreenVM extends ChangeNotifier {
  int receiverId;
  List<MessageModel> messages = [];
  final apiService = GetIt.instance.get<ApiService>();
  late MessageRepository messageRepository;
  late PaginationController paginationController;
  final controller =
      ScrollController(initialScrollOffset: 0.7, keepScrollOffset: true);

  ChatScreenVM({required this.receiverId}) {
    messageRepository = MessageRepositoryImpl(apiService: apiService);
    paginationController =
        PaginationController(controller: controller, onScroll: () {});
    getMessages();
  }

  Future<void> onScroll() async {
    log("called");
    messages.add(MessageModel(content: "asdsdas"));
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
    addScrollListener();
    await Future.delayed(Duration(seconds: 1));
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
}

