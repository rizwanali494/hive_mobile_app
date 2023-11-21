class AwardsModel {
  AwardsModel({
    this.id,
    this.achievement,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.regionId,
    this.cityId,
    this.description,
    this.owner,
    this.student,
  });

  AwardsModel.fromJson(dynamic json) {
    id = json['id'];
    achievement = json['achievement'] != null
        ? Achievement.fromJson(json['achievement'])
        : null;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    description = json['description'];
    owner = json['owner'];
    student = json['student'];
  }

  int? id;
  Achievement? achievement;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? regionId;
  int? cityId;
  String? description;
  int? owner;
  int? student;

  AwardsModel copyWith({
    int? id,
    Achievement? achievement,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? regionId,
    int? cityId,
    String? description,
    int? owner,
    int? student,
  }) =>
      AwardsModel(
        id: id ?? this.id,
        achievement: achievement ?? this.achievement,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        description: description ?? this.description,
        owner: owner ?? this.owner,
        student: student ?? this.student,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (achievement != null) {
      map['achievement'] = achievement?.toJson();
    }
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['description'] = description;
    map['owner'] = owner;
    map['student'] = student;
    return map;
  }
}

class Achievement {
  Achievement({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.name,
    this.attachment,
  });

  Achievement.fromJson(dynamic json) {
    id = json['id'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    name = json['name'];
    attachment = json['attachment'];
  }

  num? id;
  String? dateAdded;
  String? dateLastModified;
  String? name;
  String? attachment;

  Achievement copyWith({
    num? id,
    String? dateAdded,
    String? dateLastModified,
    String? name,
    String? attachment,
  }) =>
      Achievement(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        name: name ?? this.name,
        attachment: attachment ?? this.attachment,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['name'] = name;
    map['attachment'] = attachment;
    return map;
  }
}
