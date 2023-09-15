import 'package:hive_mobile/app/models/data/awards_model.dart';
import 'package:isar/isar.dart';

import 'announcement_post_models/attachments_model.dart';

part "inbox_model.g.dart";

@collection
class InboxModel {
  InboxModel({
    this.id,
    this.localId = 1,
    this.email,
    this.accountType,
    this.picture,
    this.content,
    this.date,
  });

  InboxModel.fromJson(dynamic json) {
    id = json['id'];
    localId = json['id'] ?? 0;
    email = json['email'];
    accountType = json['account_type'];
    picture =
        json['picture'] != null ? Attachments.fromJson(json['picture']) : null;
    content = json['content'];
    date = json['date'];
  }

  int? id;
  late Id? localId;
  String? email;
  String? accountType;
  Attachments? picture;
  String? content;
  String? date;

  InboxModel copyWith({
    int? id,
    int? localId,
    String? email,
    String? accountType,
    Attachments? picture,
    String? content,
    String? date,
  }) =>
      InboxModel(
        id: id ?? this.id,
        localId: localId ?? this.localId,
        email: email ?? this.email,
        accountType: accountType ?? this.accountType,
        picture: picture ?? this.picture,
        content: content ?? this.content,
        date: date ?? this.date,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['account_type'] = accountType;
    if (picture != null) {
      map['picture'] = picture?.toJson();
    }
    map['content'] = content;
    map['date'] = date;
    return map;
  }

  @override
  String toString() {
    return 'InboxModel{id: $id, localId: $localId, email: $email, accountType: $accountType, picture: $picture, content: $content, date: $date}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InboxModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}