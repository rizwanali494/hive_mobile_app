import 'package:isar/isar.dart';

part 'subject_model.g.dart';

@embedded
class Subjects {
  Subjects({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.name,
    this.grade,
    this.owner,
  });

  Subjects.fromJson(dynamic json) {
    id = json['id'];
    grade = json['grade'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    name = json['name'];
    owner = json['owner'];
  }

  int? id;
  String? dateAdded;
  String? dateLastModified;
  String? grade;
  int? branchId;
  String? name;
  int? owner;

  Subjects copyWith({
    int? id,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    String? name,
    String? grade,
    int? owner,
  }) =>
      Subjects(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        name: name ?? this.name,
        grade: grade ?? this.grade,
        owner: owner ?? this.owner,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['grade'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['name'] = name;
    map['owner'] = owner;
    return map;
  }
}
