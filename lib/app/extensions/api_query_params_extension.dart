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

  String selectPoll(int id) {
    return "${this}poll/$id/select/";
  }

  String withPostModel(int id) {
    return "${this}$id/";
  }

  String withLike(int id) {
    return "${this}$id/like/";
  }

  String withDislike(int id) {
    return "${this}$id/dislike/";
  }

  String get withMostRecentOrder {
    return _appendQueryParameter("ordering=-date_added");
  }

  String get withCount {
    return _appendQueryParameter("_count=true");
  }

  String get withApprovedState {
    return _appendQueryParameter("state=APPROVED");
  }

  String get withPendingState {
    return _appendQueryParameter("state=PENDING");
  }

  String get withRejectedState {
    return _appendQueryParameter("state=REJECTED");
  }

  String _appendQueryParameter(String parameter) {
    if (this.contains("?")) {
      return "${this}&$parameter";
    }
    return "${this}?$parameter";
  }
}
