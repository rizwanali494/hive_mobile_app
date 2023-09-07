import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/pagination_state_model.dart';

class PaginationController {
  late ScrollController _scrollController;
  int _offset = 10;
  late Function onScroll;
  bool _isGettingMore = false;
  bool isLastPage = false;
  PaginationState state = PaginationState.Loaded();

  int get offset => _offset;

  PaginationController(
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
