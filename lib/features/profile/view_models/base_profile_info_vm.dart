import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';

abstract class BaseProfileInfoVM<T> with ChangeNotifier {
  final limit = 10;
  int offset = 0;
  bool hasAll = false;
  bool isGettingMore = false;
  bool iLoading = true;
  bool hasError = false;

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
      if (items.length < 10) {
        hasAll = true;
      }
      this.items = items;
    };
    await performRequest(request: request);
    iLoading = false;
    notifyListeners();
  }

  Future<void> fetchNextItems() async {
    final request = () async {
      var list = await getInitialElements();
      if (list.length < 10) {
        hasAll = true;
      }
      offset += list.length;
      items.addAll(list);
    };
    await performRequest(request: request);
    notifyListeners();
  }

  Future<void> performRequest({required Function request}) async {
    try {
      await request();
    } catch (e) {
      hasError = true;
      if (e is HTTPStatusCodeException) {
        log("Error occurred : ${e.response.body}");
        log("Error occurred : ${e.response.statusCode}");
      }
      log("Error occurred : $e");
    }
  }
}
