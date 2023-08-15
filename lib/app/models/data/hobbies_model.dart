import 'package:isar/isar.dart';

part 'hobbies_model.g.dart';

@embedded
class HobbiesModel {
  HobbiesModel({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.name,
  });

  HobbiesModel.fromJson(dynamic json) {
    id = json['id'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    name = json['name'];
  }

  int? id;
  String? dateAdded;
  String? dateLastModified;
  String? name;

  HobbiesModel copyWith({
    int? id,
    String? dateAdded,
    String? dateLastModified,
    String? name,
  }) =>
      HobbiesModel(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['name'] = name;
    return map;
  }
}
