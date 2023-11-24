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
    this.content,
    this.isRead,
    this.attachedObjectType,
    this.attachedObjectId,
    this.recipient,
    this.attachments,
    this.localRead = false,
  });

  NotificationModel.fromJson(dynamic json, {this.localRead = false}) {
    id = json['id'];
    localId = json['id'] ?? 0;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    content = json['content'];
    isRead = json['is_read'];
    attachedObjectType = json['attached_object_type'];
    attachedObjectId = json['attached_object_id'];
    recipient = json['recipient'];
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments?.add(Attachments.fromJson(v));
      });
    }
  }

  int? id;
  late Id localId;
  String? dateAdded;
  String? dateLastModified;
  String? content;
  bool? isRead;
  final bool localRead;
  String? attachedObjectType;
  int? attachedObjectId;
  int? recipient;
  List<Attachments>? attachments;

  NotificationModel copyWith({
    int? id,
    int? localId,
    String? dateAdded,
    String? dateLastModified,
    String? content,
    bool? isRead,
    bool? localRead,
    String? attachedObjectType,
    int? attachedObjectId,
    int? recipient,
    List<Attachments>? attachments,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        localRead: localRead ?? this.localRead,
        localId: localId ?? this.localId,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        content: content ?? this.content,
        isRead: isRead ?? this.isRead,
        attachedObjectType: attachedObjectType ?? this.attachedObjectType,
        attachedObjectId: attachedObjectId ?? this.attachedObjectId,
        recipient: recipient ?? this.recipient,
        attachments: attachments?.map((e) => e.copyWith()).toList() ??
            this.attachments?.map((e) => e.copyWith()).toList(),
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['content'] = content;
    map['is_read'] = isRead;
    map['attached_object_type'] = attachedObjectType;
    map['attached_object_id'] = attachedObjectId;
    map['recipient'] = recipient;
    if (attachments != null) {
      map['attachments'] = attachments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
