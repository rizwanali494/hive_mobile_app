import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/models/data/message_model.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
class ChatWidgetVM {
  final MessageModel model;

  ChatWidgetVM({required this.model});

  String get content => model.content ?? "";
  String get timeSent => model.dateAdded?.timeAgo ?? "";
}
