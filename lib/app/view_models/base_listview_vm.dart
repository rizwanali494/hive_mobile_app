import 'package:flutter/material.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';

class BaseListViewVM<T>{
  List<T> items = [];
  final UiState uiState;
  final Future<void> Function() refreshList;
  final ScrollController scrollController ;
  final int itemCount;

  BaseListViewVM({
    required this.items,
    required this.uiState,
    required this.refreshList,
    required this.scrollController,
    required this.itemCount,
  });

  bool get hasError => uiState.hasError;
  bool get isLoading => uiState.isLoading;
  bool get isGettingMore => uiState.isFetchingMore;

  BaseListViewVM copyWith({
    List<T>? items,
    UiState? uiState,
    Future<void> Function()? refreshList,
    ScrollController? scrollController,
    int? itemCount,
  }) {
    return BaseListViewVM(
      items: items ?? this.items,
      uiState: uiState ?? this.uiState,
      refreshList: refreshList ?? this.refreshList,
      scrollController: scrollController ?? this.scrollController,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}