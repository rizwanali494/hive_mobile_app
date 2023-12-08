import 'package:hive_mobile/app/models/data/announcement_post_models/polls_model.dart';

import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/owner_model.dart';
import 'package:isar/isar.dart';

import 'package:hive_mobile/app/models/data/announcement_post_models/account_data_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/account_extra_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/account_picture_model.dart';

part 'announcement_post_model.g.dart';

@collection
class AnnouncementPostModel {
  AnnouncementPostModel({
    this.id,
    this.localId = 0,
    this.likes,
    this.dislikes,
    this.isLiked,
    this.isDisliked,
    this.polls,
    this.attachments,
    this.owner,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.text,
    this.type,
    this.expiryDate,
    // this.event,
  });

  AnnouncementPostModel.fromJson(dynamic json) {
    id = json['id'];
    localId = json['id'] ?? 0;
    likes = json['likes'];
    dislikes = json['dislikes'];
    isLiked = json['is_liked'];
    isDisliked = json['is_disliked'];
    if (json['polls'] != null) {
      polls = [];
      json['polls'].forEach((v) {
        polls?.add(Polls.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments?.add(Attachments.fromJson(v));
      });
    }
    owner = json['owner'] != null ? OwnerModel.fromJson(json['owner']) : null;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    text = json['text'];
    type = json['type'];
    expiryDate = json['expiry_date'];
    // event = json['event'];
  }

  int? id;
  late Id localId;

  int? likes;
  int? dislikes;
  List<Polls>? polls;
  List<Attachments>? attachments;
  OwnerModel? owner;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  String? text;
  String? type;
  String? expiryDate;
  bool? isLiked;
  bool? isDisliked;

  // Map? event;

  AnnouncementPostModel copyWith({
    int? id,
    int? localId,
    int? likes,
    int? dislikes,
    bool? isLiked,
    bool? isDisliked,
    List<Polls>? polls,
    List<Attachments>? attachments,
    OwnerModel? owner,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    String? text,
    String? expiryDate,
    String? type,
    // Map? event,
  }) =>
      AnnouncementPostModel(
          id: id ?? this.id,
          likes: likes ?? this.likes,
          dislikes: dislikes ?? this.dislikes,
          isLiked: isLiked ?? this.isLiked,
          isDisliked: isDisliked ?? this.isDisliked,
          polls: polls?.map((e) => e.copyWith()).toList() ??
              this.polls?.map((e) => e.copyWith()).toList(),
          localId: localId ?? this.localId,
          attachments: attachments ?? this.attachments,
          owner: owner ?? this.owner,
          dateAdded: dateAdded ?? this.dateAdded,
          dateLastModified: dateLastModified ?? this.dateLastModified,
          branchId: branchId ?? this.branchId,
          text: text ?? this.text,
          type: type ?? this.type,
          // event: event ?? this.event,
          expiryDate: expiryDate ?? this.expiryDate);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['likes'] = likes;
    map['dislikes'] = dislikes;
    map['is_liked'] = isLiked;
    map['is_disliked'] = isDisliked;
    if (polls != null) {
      map['polls'] = polls?.map((v) => v.toJson()).toList();
    }
    if (attachments != null) {
      map['attachments'] = attachments?.map((v) => v.toJson()).toList();
    }
    if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['text'] = text;
    map['type'] = type;
    // map["event"] = event;
    return map;
  }

  @ignore
  bool get isPost => type == "POST";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AnnouncementPostModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}
