import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/owner_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:isar/isar.dart';

import 'package:hive_mobile/app/models/data/announcement_post_models/account_data_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/account_extra_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/account_picture_model.dart';

part 'activity_model.g.dart';

@collection
class ActivityModel {
  ActivityModel({
    this.id,
    this.localId = 0,
    this.attendingStudents,
    this.nonAttendingStudents,
    this.skepticalStudents,
    this.selection,
    this.banner,
    this.owner,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.name,
    this.location,
    this.description,
    this.date,
    this.bio,
  });

  ActivityModel.fromJson(dynamic json) {
    id = json['id'];
    localId = json['id'] ?? 0;
    attendingStudents = json['attending_students'];
    nonAttendingStudents = json['non_attending_students'];
    skepticalStudents = json['skeptical_students'];
    selection = json['selection'];
    banner =
        json['banner'] != null ? Attachments.fromJson(json['banner']) : null;
    owner = json['owner'] != null ? OwnerModel.fromJson(json['owner']) : null;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    date = json['date'];
    bio = json['bio'];
  }

  int? id;
  late Id localId;
  int? attendingStudents;
  int? nonAttendingStudents;
  int? skepticalStudents;
  String? selection;
  Attachments? banner;
  OwnerModel? owner;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  String? cityId;
  String? name;
  String? location;
  String? description;
  String? date;
  String? bio;

  ActivityModel copyWith({
    int? id,
    int? attendingStudents,
    int? nonAttendingStudents,
    int? skepticalStudents,
    String? selection,
    Attachments? banner,
    OwnerModel? owner,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    String? cityId,
    String? name,
    String? location,
    String? description,
    String? date,
    String? bio,
  }) =>
      ActivityModel(
        id: id ?? this.id,
        attendingStudents: attendingStudents ?? this.attendingStudents,
        nonAttendingStudents: nonAttendingStudents ?? this.nonAttendingStudents,
        skepticalStudents: skepticalStudents ?? this.skepticalStudents,
        selection: selection ?? this.selection,
        banner: banner ?? this.banner,
        owner: owner ?? this.owner,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        name: name ?? this.name,
        location: location ?? this.location,
        description: description ?? this.description,
        date: date ?? this.date,
        bio: bio ?? this.bio,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['attending_students'] = attendingStudents;
    map['non_attending_students'] = nonAttendingStudents;
    map['skeptical_students'] = skepticalStudents;
    map['selection'] = selection;
    if (banner != null) {
      map['banner'] = banner?.toJson();
    }
    if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['name'] = name;
    map['location'] = location;
    map['description'] = description;
    map['date'] = date;
    map['bio'] = bio;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @ignore
  ActivityStatus? get getSelection {
    if (selection?.toLowerCase() == AppStrings.attending.toLowerCase()) {
      return ActivityStatus.Attending;
    }
    if (selection?.toLowerCase() == AppStrings.SKEPTICAL.toLowerCase()) {
      return ActivityStatus.Maybe;
    }
    if (selection?.toLowerCase() == AppStrings.NON_ATTENDING.toLowerCase()) {
      return ActivityStatus.Undecided;
    }
    return null;
  }
}

enum ActivityStatus { Attending, Maybe, Undecided }
