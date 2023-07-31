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

  String withOffSet(int? offSet) {
    return _appendPaginationParameter("offset", offSet);
  }

  String withLimit(int? limit) {
    return _appendPaginationParameter("limit", limit);
  }

  String _appendPaginationParameter(String para, int? value) {
    if (value == null) {
      return this;
    }
    if (this.contains("?")) {
      return "$this&$para=$value";
    }
    return "$this?$para=$value";
  }

  String _appendExpandField(String field) {
    if (this.contains(ApiExpandField.expandQueryName)) {
      return "$this,$field";
    }
    return "$this?${ApiExpandField.expandQueryName}=$field";
  }
}
