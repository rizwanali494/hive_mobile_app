import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/message_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/models/pagination_state_model.dart';
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
  late RevPaginationController paginationController;
  final controller = ScrollController();

  ChatScreenVM({required this.receiverId}) {
    messageRepository = MessageRepositoryImpl(apiService: apiService);
    paginationController =
        RevPaginationController(controller: controller, onScroll: () {});
    getMessages();
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
    uiState = UiState.loaded();
    notifyListeners();
  }

  Future<void> performRequest({required Function request}) async {}

  Future<List<MessageModel>> getLocalMessages() async {
    var list = await localService
        .query()
        .filter()
        .receiverEqualTo(receiverId)
        .findAll();
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
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        if (_isGettingMore || isLastPage) {
          log("not getting last page : ${isLastPage}  isGettingMore : ${_isGettingMore}");
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
