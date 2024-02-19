import 'package:isar/isar.dart';

part 'subject_model.g.dart';

@embedded
class SubjectModel {
  SubjectModel({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.name,
    this.grade,
    this.owner,
    this.externalGrade,
    this.gpa,
  });

  SubjectModel.fromJson(dynamic json) {
    id = json['id'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    name = json['name'];
    grade = json['grade'];
    gpa = double.tryParse(json['gpa']) ?? 0.0;
    owner = json['owner'];
    externalGrade = json['external_grade'];
  }

  int? id;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  int? cityId;
  String? name;
  String? grade;
  int? owner;
  int? externalGrade;
  double? gpa;

  SubjectModel copyWith({
    int? id,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    int? cityId,
    String? name,
    String? grade,
    int? owner,
    int? externalGrade,
    double? gpa,
  }) =>
      SubjectModel(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        name: name ?? this.name,
        grade: grade ?? this.grade,
        owner: owner ?? this.owner,
        externalGrade: externalGrade ?? this.externalGrade,
        gpa: gpa ?? this.gpa,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['name'] = name;
    map['grade'] = grade;
    map['owner'] = owner;
    map['external_grade'] = externalGrade;
    map['gpa'] = gpa;
    return map;
  }
}
