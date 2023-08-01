import 'package:hive_mobile/app/models/data/announcement_post_models/account_extra_model.dart';
import 'package:isar/isar.dart';

part 'account_data_model.g.dart';

@embedded
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

  int? id;
  AccountExtra? extra;
  String? dateAdded;
  String? dateLastModified;
  int? branchId;
  int? owner;

  AccountDataModel copyWith({
    int? id,
    AccountExtra? extra,
    String? dateAdded,
    String? dateLastModified,
    int? branchId,
    int? owner,
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
