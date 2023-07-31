import 'package:hive_mobile/app/models/polls_model.dart';

import 'package:hive_mobile/app/models/attachments_model.dart';
import 'package:hive_mobile/app/models/owner_model.dart';

class AnnouncementPostModel {
  AnnouncementPostModel({
    this.id,
    this.likes,
    this.dislikes,
    this.polls,
    this.attachments,
    this.owner,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.text,
    this.type,
  });

  AnnouncementPostModel.fromJson(dynamic json) {
    id = json['id'];
    likes = json['likes'];
    dislikes = json['dislikes'];
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
  }

  num? id;
  num? likes;
  num? dislikes;
  List<Polls>? polls;
  List<Attachments>? attachments;
  OwnerModel? owner;
  String? dateAdded;
  String? dateLastModified;
  num? branchId;
  String? text;
  String? type;

  AnnouncementPostModel copyWith({
    num? id,
    num? likes,
    num? dislikes,
    List<Polls>? polls,
    List<Attachments>? attachments,
    OwnerModel? owner,
    String? dateAdded,
    String? dateLastModified,
    num? branchId,
    String? text,
    String? type,
  }) =>
      AnnouncementPostModel(
        id: id ?? this.id,
        likes: likes ?? this.likes,
        dislikes: dislikes ?? this.dislikes,
        polls: polls ?? this.polls,
        attachments: attachments ?? this.attachments,
        owner: owner ?? this.owner,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        text: text ?? this.text,
        type: type ?? this.type,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['likes'] = likes;
    map['dislikes'] = dislikes;
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
    return map;
  }
}
