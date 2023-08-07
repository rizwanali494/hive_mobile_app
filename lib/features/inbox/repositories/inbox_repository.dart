import 'dart:convert';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_fields_expands_extension.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class InboxRepository {
  late ApiService apiService;

  InboxRepository({required this.apiService});

  Future<List> getInitialInboxList({int? limit});

  Future<List> getNextInboxList({int? offSet, int? limit});

  Future<void> read();
}

class InboxRepositoryImpl extends InboxRepository {
  InboxRepositoryImpl({required super.apiService});

  @override
  Future<List> getInitialInboxList({int? limit}) async {
    var response = await apiService.get(
      url: ApiEndpoints.inbox.withOwnerObject.withPolls.withAttachments
          .withLimit(limit),
    );
    var result = jsonDecode(response.body);
    List items = result["results"] ?? [];
    return Future.value([]);
  }

  @override
  Future<List> getNextInboxList({int? offSet, int? limit}) async {
    var response = await apiService.get(
      url: ApiEndpoints.inbox.withOwnerObject.withPolls.withAttachments
          .withLimit(limit)
          .withOffSet(offSet),
    );
    var result = jsonDecode(response.body);

    return Future.value([]);
  }

  @override
  Future<void> read() async {}
}
