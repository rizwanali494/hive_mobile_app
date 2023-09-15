import 'dart:convert';
import 'dart:developer';

import 'package:hive_mobile/app/constants/api_endpoints.dart';
import 'package:hive_mobile/app/extensions/api_query_params_extension.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/models/data/message_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';

abstract class MessageRepository {
  late ApiService apiService;

  MessageRepository({required this.apiService});

  Future<List<MessageModel>> getMessages(
      {int? limit, int? offset, required int receiverId});
}

class MessageRepositoryImpl extends MessageRepository {
  MessageRepositoryImpl({required super.apiService});

  @override
  Future<List<MessageModel>> getMessages(
      {int? limit, int? offset, required int receiverId}) async {
    var url = ApiEndpoints.message
        .withLimit(limit)
        .withOffSet(offset)
        .withReceiverId(receiverId);
    log(url);
    var response = await apiService.get(
      url: url,
    );
    var result = jsonDecode(response.body);
    List items = result["results"] ?? [];
    log("messeage spe count : ${items.length}");
    return items.map((e) => MessageModel.fromJson(e)).toList();
  }
}
