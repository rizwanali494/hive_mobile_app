import 'package:flutter/cupertino.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/models/data/message_model.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/features/inbox/view_models/chat_screen_vm.dart';
import 'package:provider/provider.dart';

class ChatWidgetVM {
  final MessageModel model;

  ChatWidgetVM({required this.model});

  String get content => model.content ?? "";

  String get timeSent => model.dateAdded?.timeAgo ?? "";

  bool get isSending => model.messageState.isSending;

  bool get hasError => model.messageState.hasError;

  void retry(BuildContext context) {
    final provider = context.read<ChatScreenVM>();
    provider.retryMessage(model);
  }
}
