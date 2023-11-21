import 'package:isar/isar.dart';

part 'message_model.g.dart';

@collection
class MessageModel {
  MessageModel({
    this.id,
    this.localId = 0,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.content,
    this.isRead,
    this.owner,
    this.receiver,
    this.messageState = const MessageState.Sent(),
  });

  MessageModel.fromJson(dynamic json) {
    id = json['id'];
    localId = json['id'] ?? 0;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    content = json['content'];
    isRead = json['is_read'];
    owner = json['owner'];
    receiver = json['receiver'];
  }

  int? id;
  late Id? localId;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  int? cityId;
  String? content;
  bool? isRead;
  int? owner;
  int? receiver;
  @ignore
  MessageState messageState = const MessageState.Sent();

  MessageModel copyWith({
    int? id,
    Id? localId,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    int? cityId,
    String? content,
    bool? isRead,
    int? owner,
    int? receiver,
    MessageState? messageState,
  }) =>
      MessageModel(
        id: id ?? this.id,
        localId: localId ?? this.localId,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        content: content ?? this.content,
        isRead: isRead ?? this.isRead,
        owner: owner ?? this.owner,
        receiver: receiver ?? this.receiver,
        messageState: messageState ?? this.messageState,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['content'] = content;
    map['is_read'] = isRead;
    map['owner'] = owner;
    map['receiver'] = receiver;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class MessageState {
  final bool isSent;
  final bool hasError;
  final bool isSending;

  const MessageState.Sent()
      : isSent = true,
        hasError = false,
        isSending = false;

  const MessageState.Sending()
      : isSent = false,
        hasError = false,
        isSending = true;

  const MessageState.hasError()
      : isSent = false,
        hasError = true,
        isSending = false;
}
