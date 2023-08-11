import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:isar/isar.dart';

part 'notification_model.g.dart';

@collection
class NotificationModel {
  NotificationModel({
    this.id,
    this.localId = 0,
    this.dateAdded,
    this.dateLastModified,
    this.file,
    this.purpose,
    this.label,
    this.mimeType,
    this.owner,
    this.attachments,
  });

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    localId = json['id'] ?? 0;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    file = json['file'];
    purpose = json['purpose'];
    label = json['label'];
    mimeType = json['mime_type'];
    owner = json['owner'];
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments?.add(Attachments.fromJson(v));
      });
    }
  }

  String? id;
  late Id localId;
  String? dateAdded;
  String? dateLastModified;
  String? file;
  String? purpose;
  String? label;
  String? mimeType;
  int? owner;
  List<Attachments>? attachments;

  NotificationModel copyWith({
    String? id,
    int? localId,
    String? dateAdded,
    String? dateLastModified,
    String? file,
    String? purpose,
    String? label,
    String? mimeType,
    int? owner,
    List<Attachments>? attachments,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        localId: localId ?? this.localId,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        file: file ?? this.file,
        purpose: purpose ?? this.purpose,
        label: label ?? this.label,
        mimeType: mimeType ?? this.mimeType,
        owner: owner ?? this.owner,
        attachments: attachments ?? this.attachments,
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
    if (attachments != null) {
      map['attachments'] = attachments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
