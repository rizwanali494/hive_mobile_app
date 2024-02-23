import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';

class AwardsModel {
  AwardsModel({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.achievement,
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
    regionId = json['region_id'];
    cityId = json['city_id'];
    achievement = json['achievement'];
    description = json['description'];
    owner = json['owner'];
    student = json['student'];
    // attachment = json['attachment'] != null
    //     ? Attachments.fromJson(json['attachment'])
    //     : null;
  }

  int? id;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  int? cityId;
  String? achievement;
  String? description;
  int? owner;
  int? student;
  Attachments? attachment;

  AwardsModel copyWith({
    int? id,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    int? cityId,
    String? achievement,
    String? description,
    int? owner,
    int? student,
    Attachments? attachment,
  }) =>
      AwardsModel(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        achievement: achievement ?? this.achievement,
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
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['achievement'] = achievement;
    map['description'] = description;
    map['owner'] = owner;
    map['student'] = student;
    if (attachment != null) {
      map['attachment'] = attachment?.toJson();
    }
    return map;
  }
}

