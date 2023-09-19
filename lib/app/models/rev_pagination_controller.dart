import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/pagination_state_model.dart';

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
      final nextPageTrigger = 50 + _scrollController.position.minScrollExtent;
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
