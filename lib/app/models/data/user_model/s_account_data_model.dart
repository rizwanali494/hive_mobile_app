import 'dart:developer';

import 'package:hive_mobile/app/models/data/hobbies_model.dart';
import 'package:hive_mobile/app/models/data/user_model/s_extra_model.dart';
import 'package:isar/isar.dart';

part 's_account_data_model.g.dart';

@embedded
class StudentAccountData {
  StudentAccountData({
    this.id,
    this.extra,
    this.dateAdded,
    this.dateLastModified,
    this.classId,
    this.regionId,
    this.cityId,
    this.branchId,
    this.status,
    this.backupEmail,
    this.owner,
    this.hobbies,
    this.studentName,
    this.isBackUpEmailVerified,
  });

  StudentAccountData.fromJson(dynamic json) {
    id = json['id'];
    extra = json['extra'] != null ? StudentExtra.fromJson(json['extra']) : null;
    log("extra");
    dateAdded = json['date_added'];
    studentName = json['student_name'];
    dateLastModified = json['date_last_modified'];
    isBackUpEmailVerified = json['is_backup_email_verified'];
    classId = json['class_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    branchId = json['branch_id'];
    status = json['status'];
    backupEmail = json['backup_email'];
    owner = json['owner'];
    if (json['hobbies'] != null) {
      List list = json["hobbies"]??[];
      hobbies = List.generate(
        list.length,
            (index) => HobbiesModel.fromJson(
          list[index],
        ),
      );
    }
  }

  int? id;
  StudentExtra? extra;
  String? dateAdded;
  String? studentName;
  String? dateLastModified;
  int? classId;
  int? regionId;
  int? cityId;
  int? branchId;
  String? status;
  bool? isBackUpEmailVerified;
  String? backupEmail;
  int? owner;
  List<HobbiesModel>? hobbies;

  StudentAccountData copyWith({
    int? id,
    StudentExtra? extra,
    String? dateAdded,
    String? studentName,
    String? dateLastModified,
    int? classId,
    int? regionId,
    int? cityId,
    int? branchId,
    String? bio,
    String? backupEmail,
    int? owner,
    List<HobbiesModel>? hobbies,
    bool? isBackUpEmailVerified,
  }) =>
      StudentAccountData(
        id: id ?? this.id,
        extra: extra ?? this.extra,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        classId: classId ?? this.classId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        branchId: branchId ?? this.branchId,
        studentName: studentName ?? this.studentName,
        status: bio ?? this.status,
        backupEmail: backupEmail ?? this.backupEmail,
        isBackUpEmailVerified:
        isBackUpEmailVerified ?? this.isBackUpEmailVerified,
        owner: owner ?? this.owner,
        hobbies: hobbies?.map((e) => e.copyWith()).toList() ??
            this.hobbies?.map((e) => e.copyWith()).toList(),
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (extra != null) {
      map['extra'] = extra?.toJson();
    }
    map['date_added'] = dateAdded;
    map['student_name'] = studentName;
    map['date_last_modified'] = dateLastModified;
    map['class_id'] = classId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['branch_id'] = branchId;
    map['status'] = status;
    map['backup_email'] = backupEmail;
    map['is_backup_email_verified'] = isBackUpEmailVerified;
    map['owner'] = owner;
    if (hobbies != null) {
      map['hobbies'] = hobbies?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
