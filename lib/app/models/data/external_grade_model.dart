import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/subject_model.dart';

class ExternalGradeModel {
  ExternalGradeModel({
    this.id,
    this.subjects,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.institutionName,
    this.degree,
    this.state,
    this.resultFile,
  });

  ExternalGradeModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subjects.fromJson(v));
      });
    }
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    institutionName = json['institution_name'];
    degree = json['degree'];
    state = json['state'];
    resultFile = json['result_file'] != null
        ? Attachments.fromJson(json['result_file'])
        : null;
  }

  num? id;
  List<Subjects>? subjects;
  String? dateAdded;
  String? dateLastModified;
  num? branchId;
  String? institutionName;
  String? degree;
  String? state;
  Attachments? resultFile;

  ExternalGradeModel copyWith({
    num? id,
    List<Subjects>? subjects,
    String? dateAdded,
    String? dateLastModified,
    num? branchId,
    String? institutionName,
    String? degree,
    String? state,
    Attachments? resultFile,
  }) =>
      ExternalGradeModel(
        id: id ?? this.id,
        subjects: subjects ?? this.subjects,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        institutionName: institutionName ?? this.institutionName,
        degree: degree ?? this.degree,
        state: state ?? this.state,
        resultFile: resultFile ?? this.resultFile,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['institution_name'] = institutionName;
    map['degree'] = degree;
    map['state'] = state;
    if (resultFile != null) {
      map['result_file'] = resultFile?.toJson();
    }
    return map;
  }
}
