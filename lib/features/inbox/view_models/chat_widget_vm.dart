import 'package:hive_mobile/app/models/data/message_model.dart';

class ChatWidgetVM {
  final MessageModel model;

  ChatWidgetVM({required this.model});

  String get content => model.content ?? "";
}
