import 'dart:developer';

import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/university_application/university_model.dart';
import 'package:isar/isar.dart';

part 'university_application_model.g.dart';

@collection
class UniversityApplicationModel {
  UniversityApplicationModel({
    this.id,
    this.localId = 0,
    this.scholarshipPercent,
    this.university,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.description,
    this.scholarshipAmount,
    this.comments,
    this.state,
    this.status,
    this.owner,
    this.documents,
  });

  UniversityApplicationModel.fromJson(dynamic json) {
    id = json['id'];
    log(id.toString());
    localId = json['id'] ?? 0;
    scholarshipPercent = json['scholarship_percent'];
    university = json['university'] != null
        ? UniversityModel.fromJson(json['university'])
        : null;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    description = json['description'];
    scholarshipAmount = json['scholarship_amount'];
    comments = json['comments'];
    state = json['state'];
    status = json['status'];
    owner = json['owner'];
    if (json['documents'] != null) {
      documents = [];
      json['documents'].forEach((v) {
        documents?.add(Attachments.fromJson(v));
      });
    }
  }

  int? id;
  late Id localId;
  String? scholarshipPercent;
  UniversityModel? university;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  int? cityId;
  String? description;
  String? scholarshipAmount;
  String? comments;
  String? state;
  String? status;
  int? owner;
  List<Attachments>? documents;

  UniversityApplicationModel copyWith({
    int? id,
    int? localId,
    String? scholarshipPercent,
    UniversityModel? university,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    int? cityId,
    String? description,
    String? scholarshipAmount,
    String? comments,
    String? state,
    String? status,
    int? owner,
    List<Attachments>? documents,
  }) =>
      UniversityApplicationModel(
        id: id ?? this.id,
        localId: localId ?? this.localId,
        scholarshipPercent: scholarshipPercent ?? this.scholarshipPercent,
        university: university ?? this.university,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        description: description ?? this.description,
        scholarshipAmount: scholarshipAmount ?? this.scholarshipAmount,
        comments: comments ?? this.comments,
        state: state ?? this.state,
        status: status ?? this.status,
        owner: owner ?? this.owner,
        documents: documents?.map((e) => e.copyWith()).toList() ??
            this.documents?.map((e) => e.copyWith()).toList(),
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['scholarship_percent'] = scholarshipPercent;
    if (university != null) {
      map['university'] = university?.toJson();
    }
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['description'] = description;
    map['scholarship_amount'] = scholarshipAmount;
    map['comments'] = comments;
    map['state'] = state;
    map['status'] = status;
    map['owner'] = owner;
    if (documents != null) {
      map['documents'] = documents?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UniversityApplicationModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  ApplicationState get getState {
    switch (status?.toUpperCase()) {
      case 'APPLIED':
        return ApplicationState.applied;
      case 'ACCEPTED':
        return ApplicationState.accepted;
      case 'REJECTED':
        return ApplicationState.rejected;
      default:
        return ApplicationState.applied;
    }
  }

  ApplicationStatus get getStatus {
    switch (status?.toUpperCase()) {
      case 'APPROVED':
        return ApplicationStatus.approved;
      case 'UNAPPROVED':
        return ApplicationStatus.unapproved;
      case 'PENDING':
        return ApplicationStatus.pending;
      default:
        return ApplicationStatus.approved;
    }
  }
}
