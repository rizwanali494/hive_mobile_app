class Subjects {
  Subjects({
    this.id,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.name,
    this.owner,
  });

  Subjects.fromJson(dynamic json) {
    id = json['id'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    name = json['name'];
    owner = json['owner'];
  }

  num? id;
  String? dateAdded;
  String? dateLastModified;
  num? branchId;
  String? name;
  num? owner;

  Subjects copyWith({
    num? id,
    String? dateAdded,
    String? dateLastModified,
    num? branchId,
    String? name,
    num? owner,
  }) =>
      Subjects(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        name: name ?? this.name,
        owner: owner ?? this.owner,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['name'] = name;
    map['owner'] = owner;
    return map;
  }
}
