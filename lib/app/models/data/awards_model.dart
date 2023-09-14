import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';

class AwardsModel {
  AwardsModel({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.awardName,
    this.description,
    this.owner,
    this.student,
    this.attachment,
  });

  AwardsModel.fromJson(dynamic json) {
    id = json['id'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    awardName = json['award_name'];
    description = json['description'];
    owner = json['owner'];
    student = json['student'];
    if (json['attachment'] != null) {
      attachment = [];
      json['attachment'].forEach((v) {
        attachment?.add(Attachments.fromJson(v));
      });
    }
  }

  int? id;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  String? awardName;
  String? description;
  int? owner;
  int? student;
  List<Attachments>? attachment;

  AwardsModel copyWith({
    int? id,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    String? awardName,
    String? description,
    int? owner,
    int? student,
    List<Attachments>? attachment,
  }) =>
      AwardsModel(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        awardName: awardName ?? this.awardName,
        description: description ?? this.description,
        owner: owner ?? this.owner,
        student: student ?? this.student,
        attachment: attachment ?? this.attachment,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['award_name'] = awardName;
    map['description'] = description;
    map['owner'] = owner;
    map['student'] = student;
    if (attachment != null) {
      map['attachment'] = attachment?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

