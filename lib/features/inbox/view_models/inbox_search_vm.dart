import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/view/util/debouncer_class.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_screen_vm.dart';

class InboxSearchVM extends InboxScreenVM {
  InboxScreenVM() {
    super.uiState = UiState.loaded();
  }

  @override
  Future<void> getInitialItems() async {
    final text = controller.text.trim();
    if (text.isEmpty) {
      return;
    }
    final request = () async {
      var list = await fetchInitialItems();
      if (list.length < limit) {
        paginationController.isLastPage = true;
      } else {
        paginationController.setOffset(list.length);
      }
      items.addAll(list);
      return;
    };
    await performRequest(request: request);
    uiState = UiState.loaded();
    notifyListeners();
    // super.getInitialItems();
  }

  @override
  Future<List<InboxModel>> fetchInitialItems() {
    // TODO: implement fetchInitialItems
    throw UnimplementedError();
  }

  @override
  Future<List<InboxModel>> fetchNextItems() {
    // TODO: implement fetchNextItems
    throw UnimplementedError();
  }

  @override
  void setRepoInstance() {}

  @override
  Future<List<InboxModel>> fetchLocalList() async {
    return const <InboxModel>[];
  }

  final controller = TextEditingController();

  final debouncer = Debouncer(milliseconds: 900);

  void search() {
    debouncer.run(() {});
  }
}
