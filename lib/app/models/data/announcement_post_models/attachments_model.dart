import 'dart:developer';

import 'package:isar/isar.dart';

part 'attachments_model.g.dart';

@embedded
class Attachments {
  Attachments({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.file,
    this.purpose,
    this.label,
    this.mimeType,
    this.owner,
  });

  Attachments.fromJson(dynamic json) {
    id = json['id'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    file = json['file'];
    purpose = json['purpose'];
    label = json['label'];
    mimeType = json['mime_type'];
    owner = json['owner'];
  }

  String? id;
  String? dateAdded;
  String? dateLastModified;
  String? file;
  String? purpose;
  String? label;
  String? mimeType;
  int? owner;

  Attachments copyWith({
    String? id,
    String? dateAdded,
    String? dateLastModified,
    String? file,
    String? purpose,
    String? label,
    String? mimeType,
    int? owner,
  }) =>
      Attachments(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        file: file ?? this.file,
        purpose: purpose ?? this.purpose,
        label: label ?? this.label,
        mimeType: mimeType ?? this.mimeType,
        owner: owner ?? this.owner,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['file'] = file;
    map['purpose'] = purpose;
    map['label'] = label;
    map['mime_type'] = mimeType;
    map['owner'] = owner;
    return map;
  }
}
