import 'package:hive_mobile/app/models/data/account_extra_model.dart';

class AccountDataModel {
  AccountDataModel({
    this.id,
    this.extra,
    this.dateAdded,
    this.dateLastModified,
    this.branchId,
    this.owner,
  });

  AccountDataModel.fromJson(dynamic json) {
    id = json['id'];
    extra = json['extra'] != null ? AccountExtra.fromJson(json['extra']) : null;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    branchId = json['branch_id'];
    owner = json['owner'];
  }

  num? id;
  AccountExtra? extra;
  String? dateAdded;
  String? dateLastModified;
  num? branchId;
  num? owner;

  AccountDataModel copyWith({
    num? id,
    AccountExtra? extra,
    String? dateAdded,
    String? dateLastModified,
    num? branchId,
    num? owner,
  }) =>
      AccountDataModel(
        id: id ?? this.id,
        extra: extra ?? this.extra,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        branchId: branchId ?? this.branchId,
        owner: owner ?? this.owner,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (extra != null) {
      map['extra'] = extra?.toJson();
    }
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['branch_id'] = branchId;
    map['owner'] = owner;
    return map;
  }
}
