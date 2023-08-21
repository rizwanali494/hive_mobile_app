import 'package:isar/isar.dart';

part 'university_model.g.dart';

@embedded
class UniversityModel {
  UniversityModel({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.name,
    this.geographicalType,
    this.owner,
  });

  UniversityModel.fromJson(dynamic json) {
    id = json['id'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    name = json['name'];
    geographicalType = json['geographical_type'];
    owner = json['owner'];
  }

  int? id;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  int? cityId;
  String? name;
  String? geographicalType;
  int? owner;

  UniversityModel copyWith({
    int? id,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    int? cityId,
    String? name,
    String? geographicalType,
    int? owner,
  }) =>
      UniversityModel(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        name: name ?? this.name,
        geographicalType: geographicalType ?? this.geographicalType,
        owner: owner ?? this.owner,
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
    map['geographical_type'] = geographicalType;
    map['owner'] = owner;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniversityModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
