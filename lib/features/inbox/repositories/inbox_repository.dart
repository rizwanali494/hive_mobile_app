import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class InboxRepository {
  late ApiService apiService;

  InboxRepository({required this.apiService});

  Future<List<InboxModel>> getInitialInboxList({int? limit, int? offset});
}

class InboxRepositoryImpl extends InboxRepository {
  InboxRepositoryImpl({required super.apiService});

  @override
  Future<List<InboxModel>> getInitialInboxList(
      {int? limit, int? offset}) async {
    var response = await apiService.get(
      url: ApiEndpoints.inbox.withLimit(limit).withOffSet(offset),
    );
    log(ApiEndpoints.inbox.withLimit(limit).withOffSet(offset));
    var result = jsonDecode(response.body);
    List items = result["results"] ?? [];
    log("messeage count : ${items.length}");
    return items.map((e) => InboxModel.fromJson(e)).toList();
  }
}
