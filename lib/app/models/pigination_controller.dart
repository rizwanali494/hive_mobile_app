import 'dart:developer';

import 'package:flutter/cupertino.dart';

class PaginationController {
  late ScrollController _scrollController;
  int _offset = 10;
  late Function onScroll;
  bool _isGettingMore = false;
  bool _isLastPage = false;

  int get offset => _offset;

  PaginationController(
      {required ScrollController controller, required this.onScroll}) {
    _scrollController = controller;
  }

  void addListener() {
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        if (_isGettingMore || _isLastPage) {
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

  void toggleLastPage() {
    _isLastPage = !_isLastPage;
  }

  void toggleIsGettingMore() {
    _isGettingMore = !_isGettingMore;
  }
}
