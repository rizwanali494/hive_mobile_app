import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/extensions/list_extension.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/inbox/repositories/inbox_repository.dart';

class InboxScreenVM extends BaseApiVM<InboxModel> {
  final apiService = GetIt.instance.get<ApiService>();

  late InboxRepository inboxRepositoryImpl;

  @override
  Future<List<InboxModel>> fetchInitialItems() async {
    return await inboxRepositoryImpl.getItems(limit: limit);
  }

  @override
  Future<List<InboxModel>> fetchNextItems() async {
    return await inboxRepositoryImpl.getItems(limit: limit, offset: offSet);
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

  @override
  void sortByRecentOrder() {
    items.sortByRecentOrder(
      getDateAdded: (item) =>
          DateTime.tryParse(item.date ?? "") ?? DateTime.now(),
    );
  }
}

