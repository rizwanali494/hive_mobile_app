import 'package:hive_mobile/app/models/data/inbox_model.dart';

class InboxListVM {
  final bool isLoading;
  final bool hasError;
  final int listCount;
  Future Function() refreshList;
  final List<InboxModel> items;

  InboxListVM({
    required this.isLoading,
    required this.hasError,
    required this.listCount,
    required this.refreshList,
    required this.items,
  });
}
