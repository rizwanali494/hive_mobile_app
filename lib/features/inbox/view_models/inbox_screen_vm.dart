import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/inbox/repositories/inbox_repository.dart';

class InboxScreenVM extends BaseApiVM<InboxModel> {
  final apiService = GetIt.instance.get<ApiService>();

  late InboxRepository inboxRepositoryImpl;

  @override
  Future<List<InboxModel>> fetchInitialItems() async {
    return await inboxRepositoryImpl.getInitialInboxList(limit: limit);
  }

  @override
  Future<List<InboxModel>> fetchNextItems() async {
    return await inboxRepositoryImpl.getInitialInboxList(
        limit: limit, offset: offSet);
  }

  @override
  void setRepoInstance() {
    inboxRepositoryImpl = InboxRepositoryImpl(apiService: apiService);
  }

  bool get hasError => uiState.hasError;

  bool get isLoading => uiState.isLoading;

  List<InboxModel> get newConversation {
    return items.where((element) => element.content == null).toList();
  }

  final searchCtrl = TextEditingController();

  bool get isSearching {
    return searchCtrl.text.isNotEmpty;
  }

  Future<void> searchInbox() async {
    final text = searchCtrl.text.trim();
    if (text.isEmpty) {
      return;
    }
  }
}

class InboxSearchVM extends BaseApiVM<InboxModel> {
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
  void setRepoInstance() {

  }

  @override
  Future<List<InboxModel>> fetchLocalList() async {
    return const <InboxModel>[];
  }

  final controller = TextEditingController();

  void search() {
    getInitialItems();

  }
}
