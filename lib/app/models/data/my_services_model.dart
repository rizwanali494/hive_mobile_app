import 'package:hive_mobile/app/models/data/user_model.dart';

import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:isar/isar.dart';

import 'package:hive_mobile/app/models/data/announcement_post_models/owner_model.dart';

import 'package:hive_mobile/app/models/data/announcement_post_models/account_data_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/account_extra_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/account_picture_model.dart';

part 'my_services_model.g.dart';

@collection
class MyServicesModel {
  MyServicesModel({
    this.id,
    this.localId = 0,
    this.owner,
    this.attachments,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.name,
    this.description,
    this.isSubjectTeacherChangeRequest,
    this.state,
  });

  MyServicesModel.fromJson(dynamic json) {
    id = json['id'];
    localId = json['id'] ?? 0;
    owner = json['owner'] != null ? OwnerModel.fromJson(json['owner']) : null;
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments?.add(Attachments.fromJson(v));
      });
    }
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    name = json['name'];
    description = json['description'];
    isSubjectTeacherChangeRequest = json['is_subject_teacher_change_request'];
    state = json['state'];
  }

  int? id;
  late Id localId;
  OwnerModel? owner;
  List<Attachments>? attachments;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  int? cityId;
  String? name;
  String? description;
  bool? isSubjectTeacherChangeRequest;
  String? state;

  MyServicesModel copyWith({
    int? id,
    Id? localId,
    OwnerModel? owner,
    List<Attachments>? attachments,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    int? cityId,
    String? name,
    String? description,
    bool? isSubjectTeacherChangeRequest,
    String? state,
  }) =>
      MyServicesModel(
        id: id ?? this.id,
        localId: localId ?? this.localId,
        owner: owner ?? this.owner,
        attachments: attachments ?? this.attachments,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        name: name ?? this.name,
        description: description ?? this.description,
        isSubjectTeacherChangeRequest:
            isSubjectTeacherChangeRequest ?? this.isSubjectTeacherChangeRequest,
        state: state ?? this.state,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    if (attachments != null) {
      map['attachments'] = attachments?.map((v) => v.toJson()).toList();
    }
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['name'] = name;
    map['description'] = description;
    map['is_subject_teacher_change_request'] = isSubjectTeacherChangeRequest;
    map['state'] = state;
    return map;
  }
}
