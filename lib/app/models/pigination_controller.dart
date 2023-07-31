import 'package:flutter/cupertino.dart';

class PaginationController {
  late ScrollController _scrollController;
  static const limit = 10;
  int offset = 0;
  bool _isLastPage = false;
  late Function onScroll;

  PaginationController(
      {required ScrollController controller, required this.onScroll}) {
    _scrollController = controller;
  }

  void addListener() {
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        print("here");
        onScroll();
      }
    });
  }
}
