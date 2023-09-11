import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/subject_model.dart';
import 'package:isar/isar.dart';

part 'external_grade_model.g.dart';

@collection
class ExternalGradeModel {
  ExternalGradeModel({
    this.id,
    this.localId = 0,
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
    localId = id ?? 0;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(SubjectModel.fromJson(v));
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

  int? id;
  late Id localId;
  List<SubjectModel>? subjects;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  String? institutionName;
  String? degree;
  String? state;
  Attachments? resultFile;

  ExternalGradeModel copyWith({
    int? id,
    int? localId,
    List<SubjectModel>? subjects,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    String? institutionName,
    String? degree,
    String? state,
    Attachments? resultFile,
  }) =>
      ExternalGradeModel(
        id: id ?? this.id,
        localId: localId ?? this.localId,
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExternalGradeModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
