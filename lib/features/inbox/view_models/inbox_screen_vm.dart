import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/models/pagination_controller.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view_models/base_api_vm.dart';
import 'package:hive_mobile/features/inbox/repositories/inbox_repository.dart';
import 'package:isar/isar.dart';

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
}
