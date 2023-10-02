import 'package:hive_mobile/app/models/data/announcement_post_models/account_picture_model.dart';
import 'package:hive_mobile/app/models/data/hobbies_model.dart';
import 'package:hive_mobile/app/models/data/user_model/s_account_data_model.dart';
import 'package:isar/isar.dart';

class UserModel {
  UserModel({
    this.id,
    this.picture,
    this.accountData,
    this.lastLogin,
    this.dateAdded,
    this.dateLastModified,
    this.isActive,
    this.dateJoined,
    this.email,
    this.accountType,
    this.isEmailVerified,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    picture = json['picture'] != null
        ? AccountPicture.fromJson(json['picture'])
        : null;
    accountData = json['account_data'] != null
        ? StudentAccountData.fromJson(json['account_data'])
        : null;
    lastLogin = json['last_login'];
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    email = json['email'];
    accountType = json['account_type'];
    isEmailVerified = json['is_email_verified'];
  }

  Id? id;
  AccountPicture? picture;
  StudentAccountData? accountData;
  String? lastLogin;
  String? dateAdded;
  String? dateLastModified;
  bool? isActive;
  String? dateJoined;
  String? email;
  String? accountType;
  bool? isEmailVerified;

  UserModel copyWith({
    int? id,
    AccountPicture? picture,
    StudentAccountData? accountData,
    String? lastLogin,
    String? dateAdded,
    String? dateLastModified,
    bool? isActive,
    String? dateJoined,
    String? email,
    String? accountType,
    bool? isEmailVerified,
  }) =>
      UserModel(
        id: id ?? this.id,
        picture: picture ?? this.picture,
        accountData: accountData ?? this.accountData,
        lastLogin: lastLogin ?? this.lastLogin,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        isActive: isActive ?? this.isActive,
        dateJoined: dateJoined ?? this.dateJoined,
        email: email ?? this.email,
        accountType: accountType ?? this.accountType,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (picture != null) {
      map['picture'] = picture?.toJson();
    }
    if (accountData != null) {
      map['account_data'] = accountData?.toJson();
    }
    map['last_login'] = lastLogin;
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['is_active'] = isActive;
    map['date_joined'] = dateJoined;
    map['email'] = email;
    map['account_type'] = accountType;
    map['is_email_verified'] = isEmailVerified;
    return map;
  }
}


