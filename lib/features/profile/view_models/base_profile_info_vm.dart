import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';

abstract class BaseProfileInfoVM<T> with ChangeNotifier {
  final limit = 10;
  int offset = 0;
  UiState uiState = UiState.loading();
  List<String> items = [];

  BaseProfileInfoVM() {
    setRepoInstance();
    fetchInitialElements();
  }

  Future<List<String>> getInitialElements();

  Future<List<String>> getNextElements();

  void setRepoInstance();

  Future<void> fetchInitialElements() async {
    final request = () async {
      var items = await getInitialElements();
      this.items = items;
    };
    await performRequest(request: request);
    if (items.length < 10) {
      log("hasAll");
      uiState = UiState.hasAll();
    } else {
      log("loaded");

      uiState = UiState.loaded();
    }
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
    if (items.length < 10) {
      log("has all");
      uiState = UiState.hasAll();
    } else {
      log("loaded");
      uiState = UiState.loaded();
    }
    notifyListeners();
  }

  Future<void> performRequest({required Function request}) async {
    try {
      await request();
    } catch (e) {
      uiState = UiState.error();
      if (e is HTTPStatusCodeException) {
        log("Error occurred : ${e.response.body}");
        log("Error occurred : ${e.response.statusCode}");
      }
      log("Error occurred : $e");
    }
  }
}
