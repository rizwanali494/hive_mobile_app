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
    owner = json['owner'];
    externalGrade = json['external_grade'];
  }

  int? id;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  String? regionId;
  String? cityId;
  String? name;
  String? grade;
  int? owner;
  int? externalGrade;

  SubjectModel copyWith({
    int? id,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    String? regionId,
    String? cityId,
    String? name,
    String? grade,
    int? owner,
    int? externalGrade,
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
    return map;
  }
}
