import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';

abstract class BaseSliverListVM<T>
    with ChangeNotifier, BaseExceptionController {
  final limit = 10;
  int offset = 0;
  UiState uiState = UiState.loading();
  List<T> items = [];

  BaseSliverListVM() {
    setRepoInstance();
    fetchInitialElements();
  }

  Future<List<T>> getInitialElements();

  Future<List<T>> getNextElements();

  void setRepoInstance();

  Future<void> fetchInitialElements() async {
    final request = () async {
      var items = await getInitialElements();
      this.items = items;
    };
    await performRequest(request: request);
    setUISate();
    notifyListeners();
  }

  Future<void> fetchNextItems() async {
    uiState = UiState.fetchingMore();
    notifyListeners();
    final request = () async {
      var list = await getInitialElements();
      offset += list.length;
      items.addAll(list);
    };
    await performRequest(request: request);
    setUISate();
    notifyListeners();
  }

  void setUISate() {
    if (items.length < 10) {
      log("has all");
      uiState = UiState.hasAll();
    } else {
      log("loaded");
      uiState = UiState.loaded();
    }
  }

  Future<void> performRequest(
      {required Function request, Function(dynamic error)? onError}) async {
    try {
      await request();
    } catch (e) {
      uiState = UiState.error();
      // if (e is HTTPStatusCodeException) {
      //   log("Error occurred : ${e.response.body}");
      //   log("Error occurred : ${e.response.statusCode}");
      // }
      onInitialListError.call(e);
      log("Error occurred : $e");
    }
  }

  void onInitialListError(dynamic error);
}
