import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:isar/isar.dart';

@collection
class UniversityApplicationModel {
  UniversityApplicationModel({
    this.id,
    this.scholarshipPercent,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.description,
    this.scholarshipAmount,
    this.comments,
    this.state,
    this.status,
    this.owner,
    this.university,
    this.documents,
  });

  UniversityApplicationModel.fromJson(dynamic json) {
    id = json['id'];
    scholarshipPercent = json['scholarship_percent'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    description = json['description'];
    scholarshipAmount = json['scholarship_amount'];
    comments = json['comments'];
    state = json['state'];
    status = json['status'];
    owner = json['owner'];
    university = json['university'];
    if (json['documents'] != null) {
      documents = [];
      json['documents'].forEach((v) {
        documents?.add(Attachments.fromJson(v));
      });
    }
  }

  num? id;
  String? scholarshipPercent;
  String? dateAdded;
  String? dateLastModified;
  num? branchId;
  String? description;
  String? scholarshipAmount;
  String? comments;
  String? state;
  String? status;
  num? owner;
  num? university;
  List<Attachments>? documents;

  UniversityApplicationModel copyWith({
    num? id,
    String? scholarshipPercent,
    String? dateAdded,
    String? dateLastModified,
    num? branchId,
    String? description,
    String? scholarshipAmount,
    String? comments,
    String? state,
    String? status,
    num? owner,
    num? university,
    List<Attachments>? documents,
  }) =>
      UniversityApplicationModel(
        id: id ?? this.id,
        scholarshipPercent: scholarshipPercent ?? this.scholarshipPercent,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        description: description ?? this.description,
        scholarshipAmount: scholarshipAmount ?? this.scholarshipAmount,
        comments: comments ?? this.comments,
        state: state ?? this.state,
        status: status ?? this.status,
        owner: owner ?? this.owner,
        university: university ?? this.university,
        documents: documents?.map((e) => e.copyWith()).toList() ??
            this.documents?.map((e) => e.copyWith()).toList(),
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['scholarship_percent'] = scholarshipPercent;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['description'] = description;
    map['scholarship_amount'] = scholarshipAmount;
    map['comments'] = comments;
    map['state'] = state;
    map['status'] = status;
    map['owner'] = owner;
    map['university'] = university;
    if (documents != null) {
      map['documents'] = documents?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
