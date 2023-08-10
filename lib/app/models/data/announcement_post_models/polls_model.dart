import 'package:isar/isar.dart';

part 'polls_model.g.dart';

@embedded
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
    this.isSelected,
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
    isSelected = json['is_selected'];
  }

  int? id;
  int? selectors;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  String? label;
  int? owner;
  int? post;
  bool? isSelected;

  Polls copyWith({
    int? id,
    int? selectors,
    bool? isSelected,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    String? label,
    int? owner,
    int? post,
  }) =>
      Polls(
        id: id ?? this.id,
        selectors: selectors ?? this.selectors,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        label: label ?? this.label,
        owner: owner ?? this.owner,
        isSelected: isSelected ?? this.isSelected,
        post: post ?? this.post,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['selectors'] = selectors;
    map['date_added'] = dateAdded;
    map['is_selected'] = isSelected;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['label'] = label;
    map['owner'] = owner;
    map['post'] = post;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Polls && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
