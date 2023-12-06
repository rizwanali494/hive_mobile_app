import 'package:isar/isar.dart';

part 'notification_model.g.dart';

@collection
class NotificationModel {
  NotificationModel({
    this.id = 0,
    this.dateAdded,
    this.dateLastModified,
    this.content,
    this.isRead,
    this.attachedObjectType,
    this.attachedObjectId,
    this.action,
    this.owner,
  });

  NotificationModel.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    content = json['content'];
    isRead = json['is_read'];
    attachedObjectType = json['attached_object_type'];
    attachedObjectId = json['attached_object_id'];
    action = json['action'];
    owner = json['owner'];
  }

  late Id id;

  String? dateAdded;
  String? dateLastModified;
  String? content;
  bool? isRead;
  String? attachedObjectType;
  int? attachedObjectId;
  String? action;
  int? owner;

  NotificationModel copyWith({
    Id? id,
    String? dateAdded,
    String? dateLastModified,
    String? content,
    bool? isRead,
    String? attachedObjectType,
    int? attachedObjectId,
    String? action,
    int? owner,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        content: content ?? this.content,
        isRead: isRead ?? this.isRead,
        attachedObjectType: attachedObjectType ?? this.attachedObjectType,
        attachedObjectId: attachedObjectId ?? this.attachedObjectId,
        action: action ?? this.action,
        owner: owner ?? this.owner,
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
    map['action'] = action;
    map['owner'] = owner;
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

  @ignore
  bool get isDeleteAction => action == "DELETE";
}
