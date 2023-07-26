import 'package:hive_mobile/app/constants/api_expand_fields.dart';

extension ApiFieldExpandExtension on String {
  String get withOwnerObject {
    return includeQueryParameter(ApiExpandField.owner);

    // if (this.contains("?")) {
    //   return includeQueryParameter(ApiExpandField.owner);
    //   return "$this,owner";
    // }
    // return "$this?_fields_expand=owner";
    // return "$this?_fields_expand=owner";
  }

  String get withPolls {
    return includeQueryParameter(ApiExpandField.polls);

    // if (this.contains("?")) {
    //   return includeQueryParameter(ApiExpandField.owner);
    //   return "$this,owner";
    // }
    // return "$this?_fields_expand=owner";
    // return "$this?_fields_expand=owner";
  }

  String includeQueryParameter(String field) {
    if (this.contains(ApiExpandField.expandQueryName)) {
      return "$this,$field";
    }
    return "$this?${ApiExpandField.expandQueryName}=$field";
  }
}
