import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';

class InboxTileWidgetVM {
  final InboxModel model;

  InboxTileWidgetVM({required this.model}) {}

  String get userImage => model.picture?.file ?? "";

  String get time => model.date?.timeAgoAdded ?? "";

  String get name => model.email ?? "";

  String get content => model.content ?? "";
}
