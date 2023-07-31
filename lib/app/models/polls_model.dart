class Polls {
  Polls({
    this.id,
    this.selectors,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.label,
    this.owner,
    this.post,
  });

  Polls.fromJson(dynamic json) {
    id = json['id'];
    selectors = json['selectors'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    label = json['label'];
    owner = json['owner'];
    post = json['post'];
  }

  num? id;
  num? selectors;
  String? dateAdded;
  String? dateLastModified;
  num? branchId;
  String? label;
  num? owner;
  num? post;

  Polls copyWith({
    num? id,
    num? selectors,
    String? dateAdded,
    String? dateLastModified,
    num? branchId,
    String? label,
    num? owner,
    num? post,
  }) =>
      Polls(
        id: id ?? this.id,
        selectors: selectors ?? this.selectors,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        label: label ?? this.label,
        owner: owner ?? this.owner,
        post: post ?? this.post,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['selectors'] = selectors;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['label'] = label;
    map['owner'] = owner;
    map['post'] = post;
    return map;
  }
}
