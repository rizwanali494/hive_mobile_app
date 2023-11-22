import 'dart:convert';

import 'package:hive_mobile/app/constants/api_expand_fields.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:intl/intl.dart';

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

  String get withAchievement {
    return _appendExpandField(ApiExpandField.achievement);
  }

  String withAssessmentId(int id) {
    return _appendAssessmentField(id, this);
  }

  String withAssessmentIds(List<int> ids) {
    var values = this;
    for (var value in ids) {
      values = _appendAssessmentField(value, values);
    }
    return values;
  }

  String get withBanner {
    return _appendExpandField(ApiExpandField.banner);
  }

  String get withResultFile {
    return _appendExpandField(ApiExpandField.result_file);
  }

  String get withSubjects {
    return _appendExpandField(ApiExpandField.subjects);
  }

  String get withUniversity {
    return _appendExpandField(ApiExpandField.university);
  }

  String get withDocuments {
    return _appendExpandField(ApiExpandField.documents);
  }

  String withOffSet(int? offSet) {
    return _appendPaginationParameter("offset", offSet);
  }

  String withSearch(String text) {
    return _appendQueryParameter("search=$text");
  }

  String withReceiverId(int? id) {
    return _appendPaginationParameter("receiver", id);
  }

  String withLimit(int? limit) {
    return _appendPaginationParameter("limit", limit);
  }

  String withStartDate(String date) {
    return _appendQueryParameter("date__gte=$date");
  }

  String withEndDate(String date) {
    return _appendQueryParameter("date__lte=$date");
  }

  String get withContentNull {
    return _appendQueryParameter("content__isnull=True");
  }

  String dateLessThan(String date) {
    return _appendQueryParameter("date__lt=$date");
  }

  String dateGreaterThan(String date) {
    return _appendQueryParameter("date__gt=$date");
  }

  String update(int id) {
    return "${this}$id/";
  }

  String externalGrade(int id) {
    return _appendQueryParameter("external_grade=$id");
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
    if (this.contains("?")) {
      return "$this&${ApiExpandField.expandQueryName}=$field";
    }
    return "$this?${ApiExpandField.expandQueryName}=$field";
  }

  String _appendAssessmentField(int field, String value) {
    if (value.contains(ApiExpandField.assessment_id_in)) {
      return "$value,$field";
    }
    if (this.contains("?")) {
      return "$value&${ApiExpandField.assessment_id_in}=$field";
    }
    return "$value?${ApiExpandField.assessment_id_in}=$field";
  }

  String selectPoll(int id) {
    return "${this}poll/$id/select/";
  }

  String withId(int id) {
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

  String get withMostRecentOrderDate {
    return _appendQueryParameter("ordering=-date");
  }

  String get expiredPollsFilter {
    final date = DateTime.now();
    final formatter = DateFormat("yyyy-MM-ddTHH:mm:ss");
    return _appendQueryParameter("expiry_date=${formatter.format(date)}");
  }

  String get withLeastRecentOrder {
    return _appendQueryParameter("ordering=date_added");
  }

  String get withCount {
    return _appendQueryParameter("_count=true");
  }

  String get withApprovedStatus {
    return _appendQueryParameter("status=APPROVED");
  }

  String get withApprovedState {
    return _appendQueryParameter("state=APPROVED");
  }

  String get withPendingState {
    return _appendQueryParameter("state=PENDING");
  }

  String get withPendingStatus {
    return _appendQueryParameter("status=PENDING");
  }

  String get withNotPendingState {
    return _appendQueryParameter("state__ne=PENDING");
  }

  String get withRejectedStatus {
    return _appendQueryParameter("status=REJECTED");
  }

  String get withRejectedState {
    return _appendQueryParameter("state=REJECTED");
  }

  String get withNotApprovedStatus {
    return _appendQueryParameter("status__ne=${("APPROVED").toUpperCase()}");
  }

  String get withNotApprovedState {
    return _appendQueryParameter("state__ne=${("APPROVED").toUpperCase()}");
  }

  String _appendQueryParameter(String parameter) {
    if (this.contains("?")) {
      return "${this}&$parameter";
    }
    return "${this}?$parameter";
  }
}
