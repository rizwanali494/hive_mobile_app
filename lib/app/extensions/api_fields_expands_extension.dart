import 'package:hive_mobile/app/constants/api_expand_fields.dart';

extension ApiFieldExpandExtension on String {
  String get withOwnerObject {
    return _appendExpandField(ApiExpandField.owner);
  }

  String get withPolls {
    return _appendExpandField(ApiExpandField.polls);
  }

  String get withAttachments {
    return _appendExpandField(ApiExpandField.attachments);
  }

  String withOffSet(int offSet) {
    if (this.contains("?")) {
      return "$this&Offset=$offSet";
    }
    return "$this&Offset=$offSet";
  }

  String withLimit(int limit) {
    if (this.contains("?")) {
      return "$this&Offset=$limit";
    }
    return "$this&Offset=$limit";
  }

  String _appendExpandField(String field) {
    if (this.contains(ApiExpandField.expandQueryName)) {
      return "$this,$field";
    }
    return "$this?${ApiExpandField.expandQueryName}=$field";
  }
}
