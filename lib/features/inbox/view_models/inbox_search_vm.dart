import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/view/util/debouncer_class.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_screen_vm.dart';

class InboxSearchVM extends InboxScreenVM {
  InboxScreenVM() {
   uiState = UiState.loaded();
  }

  @override
  Future<void> getInitialItems() async {
    final text = controller.text.trim();
    if (text.isEmpty || uiState.isLoading) {
      uiState = UiState.loaded();
      notifyListeners();
      return;
    }
    uiState = UiState.loading();
    notifyListeners();
    items = [];
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
  }

  @override
  Future<void> getNextItems() async {
    if (uiState.isLoading) {
      return;
    }
    super.getNextItems();
  }

  @override
  Future<List<InboxModel>> fetchInitialItems() async {
    final text = controller.text.trim();
    var list = await inboxRepositoryImpl.getSearchItems(text, limit: limit);
    return list;
  }

  @override
  Future<List<InboxModel>> fetchNextItems() async {
    final text = controller.text.trim();
    var list = await inboxRepositoryImpl.getSearchItems(text,
        offset: offSet, limit: limit);
    return list;
  }


  @override
  Future<List<InboxModel>> fetchLocalList() async {
    return const <InboxModel>[];
  }

  final controller = TextEditingController();

  final debouncer = Debouncer(milliseconds: 900);

  void search() {
    final text = controller.text.trim();
    if (text.isEmpty) {
      return;
    }
    debouncer.run(
      () {
        getInitialItems();
      },
    );
  }

  @override
  Future<void> refreshList() async {
    return;
  }
}
