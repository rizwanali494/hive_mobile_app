import 'dart:developer';

import 'package:flutter/cupertino.dart';

class PaginationController {
  late ScrollController _scrollController;
  int _offset = 10;
  late Function onScroll;

  int get offset => _offset;

  PaginationController(
      {required ScrollController controller, required this.onScroll}) {
    _scrollController = controller;
  }

  void addListener() {
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        onScroll();
      }
    });
  }

  void resetOffset() {
    _offset = 0;
  }

  set setOffset(int value) {
    _offset = value;
  }
}
