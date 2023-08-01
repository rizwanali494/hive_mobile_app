import 'package:hive_mobile/app/models/data/announcement_post_models/account_data_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/account_picture_model.dart';
import 'package:isar/isar.dart';

part 'owner_model.g.dart';

@embedded
class OwnerModel {
  OwnerModel({
    this.id,
    this.email,
    this.dateJoined,
    this.accountType,
    this.isActive,
    this.picture,
    this.accountData,
  });

  OwnerModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    dateJoined = json['date_joined'];
    accountType = json['account_type'];
    isActive = json['is_active'];
    picture = json['picture'] != null
        ? AccountPicture.fromJson(json['picture'])
        : null;
    accountData = json['account_data'] != null
        ? AccountDataModel.fromJson(json['account_data'])
        : null;
  }

  int? id;
  String? email;
  String? dateJoined;
  String? accountType;
  bool? isActive;
  AccountPicture? picture;
  AccountDataModel? accountData;

  OwnerModel copyWith({
    int? id,
    String? email,
    String? dateJoined,
    String? accountType,
    bool? isActive,
    AccountPicture? picture,
    AccountDataModel? accountData,
  }) =>
      OwnerModel(
        id: id ?? this.id,
        email: email ?? this.email,
        dateJoined: dateJoined ?? this.dateJoined,
        accountType: accountType ?? this.accountType,
        isActive: isActive ?? this.isActive,
        picture: picture ?? this.picture,
        accountData: accountData ?? this.accountData,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['date_joined'] = dateJoined;
    map['account_type'] = accountType;
    map['is_active'] = isActive;
    if (picture != null) {
      map['picture'] = picture?.toJson();
    }
    if (accountData != null) {
      map['account_data'] = accountData?.toJson();
    }
    return map;
  }
}
