import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/inbox/repositories/inbox_repository.dart';

class NewConversationScreenVM extends BaseApiVM<InboxModel> {
  final apiService = GetIt.instance.get<ApiService>();

  late InboxRepository inboxRepositoryImpl;

  @override
  Future<List<InboxModel>> fetchInitialItems() async {
    return await inboxRepositoryImpl.getNewConversation(limit: limit);
  }

  @override
  Future<List<InboxModel>> fetchLocalList() async {
    return [];
  }

  @override
  Future<void> saveToLocal(List<InboxModel> items) async {}

  @override
  Future<List<InboxModel>> fetchNextItems() async {
    return await inboxRepositoryImpl.getNewConversation(
        limit: limit, offset: offSet);
  }

  @override
  void setRepoInstance() {
    inboxRepositoryImpl = InboxRepositoryImpl(apiService: apiService);
  }

  bool get hasError => uiState.hasError;

  bool get isLoading => uiState.isLoading;
}
