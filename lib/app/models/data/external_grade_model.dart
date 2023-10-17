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
    this.certificate,
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
    certificate = json['certificate'];
    state = json['state'];
    if (json['result_files'] != null) {
      resultFile = [];
      json['result_files'].forEach((v) {
        resultFile?.add(Attachments.fromJson(v));
      });
    }
  }

  ExternalGradeModel.createJson(dynamic json) {
    id = json['id'];
    localId = id ?? 0;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    institutionName = json['institution_name'];
    certificate = json['certificate'];
    state = json['state'];
  }

  int? id;
  late Id localId;
  List<SubjectModel>? subjects;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  String? institutionName;
  String? certificate;
  String? state;
  List<Attachments>? resultFile;

  ExternalGradeModel copyWith({
    int? id,
    int? localId,
    List<SubjectModel>? subjects,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    String? institutionName,
    String? certificate,
    String? state,
    List<Attachments>? resultFile,
  }) =>
      ExternalGradeModel(
        id: id ?? this.id,
        localId: localId ?? this.localId,
        subjects: subjects ?? this.subjects,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        institutionName: institutionName ?? this.institutionName,
        certificate: certificate ?? this.certificate,
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
    map['certificate'] = certificate;
    map['state'] = state;
    if (resultFile != null) {
      map['result_files'] = resultFile?.map((e) => e.toJson()).toList();
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
