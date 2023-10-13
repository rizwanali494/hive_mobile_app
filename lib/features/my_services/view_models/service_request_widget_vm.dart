import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/data/my_services_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';

class ServiceRequestWidgetVM {
  final UiState uiState;
  final Future<void> Function() refreshList;
  final int listCount;
  final List<MyServicesModel> items;

  final ScrollController scrollController;

  bool get isLoading => uiState.isLoading;

  bool get isGettingMore => uiState.isFetchingMore;

  bool get hasError => uiState.hasError;

  const ServiceRequestWidgetVM({
    required this.uiState,
    required this.refreshList,
    required this.listCount,
    required this.items,
    required this.scrollController,
  });
}
