import 'package:flutter/material.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';

class NewConversationScreenVM extends ChangeNotifier {
  List<InboxModel> conversations = [];

  NewConversationScreenVM({this.conversations = const []});
}
