import 'package:hive_mobile/app/models/data/account_picture_model.dart';

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
        ? AccountData.fromJson(json['account_data'])
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

  num? id;
  AccountPicture? picture;
  AccountData? accountData;
  String? lastLogin;
  String? dateAdded;
  String? dateLastModified;
  bool? isActive;
  String? dateJoined;
  String? email;
  String? accountType;
  bool? isEmailVerified;

  UserModel copyWith({
    num? id,
    AccountPicture? picture,
    AccountData? accountData,
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

class AccountData {
  AccountData({
    this.id,
    this.extra,
    this.dateAdded,
    this.dateLastModified,
    this.classId,
    this.regionId,
    this.cityId,
    this.branchId,
    this.bio,
    this.backupEmail,
    this.owner,
    this.hobbies,
  });

  AccountData.fromJson(dynamic json) {
    id = json['id'];
    extra = json['extra'] != null ? Extra.fromJson(json['extra']) : null;
    dateAdded = json['date_added'];
    dateLastModified = json['date_last_modified'];
    classId = json['class_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    branchId = json['branch_id'];
    bio = json['bio'];
    backupEmail = json['backup_email'];
    owner = json['owner'];
    if (json['hobbies'] != null) {
      hobbies = [];
    }
  }

  num? id;
  Extra? extra;
  String? dateAdded;
  String? dateLastModified;
  dynamic classId;
  dynamic regionId;
  dynamic cityId;
  num? branchId;
  dynamic bio;
  dynamic backupEmail;
  num? owner;
  List<dynamic>? hobbies;

  AccountData copyWith({
    num? id,
    Extra? extra,
    String? dateAdded,
    String? dateLastModified,
    dynamic classId,
    dynamic regionId,
    dynamic cityId,
    num? branchId,
    dynamic bio,
    dynamic backupEmail,
    num? owner,
    List<dynamic>? hobbies,
  }) =>
      AccountData(
        id: id ?? this.id,
        extra: extra ?? this.extra,
        dateAdded: dateAdded ?? this.dateAdded,
        dateLastModified: dateLastModified ?? this.dateLastModified,
        classId: classId ?? this.classId,
        regionId: regionId ?? this.regionId,
        cityId: cityId ?? this.cityId,
        branchId: branchId ?? this.branchId,
        bio: bio ?? this.bio,
        backupEmail: backupEmail ?? this.backupEmail,
        owner: owner ?? this.owner,
        hobbies: hobbies ?? this.hobbies,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (extra != null) {
      map['extra'] = extra?.toJson();
    }
    map['date_added'] = dateAdded;
    map['date_last_modified'] = dateLastModified;
    map['class_id'] = classId;
    map['region_id'] = regionId;
    map['city_id'] = cityId;
    map['branch_id'] = branchId;
    map['bio'] = bio;
    map['backup_email'] = backupEmail;
    map['owner'] = owner;
    if (hobbies != null) {
      map['hobbies'] = hobbies?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Extra {
  Extra({
    this.studentId,
    this.studentName,
    this.gender,
    this.dateOfBirth,
    this.studentEmail,
    this.studentMobile,
    this.studentAddress,
    this.bloodGroup,
    this.smsNumber,
    this.linkNumber,
    this.branchId,
    this.branchName,
    this.classId,
    this.className,
    this.classOrder,
    this.sectionId,
    this.sectionName,
    this.admissionDate,
    this.leftDate,
    this.lastPresentDate,
  });

  Extra.fromJson(dynamic json) {
    studentId = json['student_id'];
    studentName = json['student_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    studentEmail = json['student_email'];
    studentMobile = json['student_mobile'];
    studentAddress = json['student_address'];
    bloodGroup = json['blood_group'];
    smsNumber = json['sms_number'];
    linkNumber = json['link_number'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    classId = json['class_id'];
    className = json['class_name'];
    classOrder = json['class_order'];
    sectionId = json['section_id'];
    sectionName = json['section_name'];
    admissionDate = json['admission_date'];
    leftDate = json['left_date'];
    lastPresentDate = json['last_present_date'];
  }

  num? studentId;
  String? studentName;
  String? gender;
  String? dateOfBirth;
  String? studentEmail;
  String? studentMobile;
  String? studentAddress;
  String? bloodGroup;
  String? smsNumber;
  num? linkNumber;
  num? branchId;
  String? branchName;
  num? classId;
  String? className;
  num? classOrder;
  num? sectionId;
  String? sectionName;
  String? admissionDate;
  dynamic leftDate;
  dynamic lastPresentDate;

  Extra copyWith({
    num? studentId,
    String? studentName,
    String? gender,
    String? dateOfBirth,
    String? studentEmail,
    String? studentMobile,
    String? studentAddress,
    String? bloodGroup,
    String? smsNumber,
    num? linkNumber,
    num? branchId,
    String? branchName,
    num? classId,
    String? className,
    num? classOrder,
    num? sectionId,
    String? sectionName,
    String? admissionDate,
    dynamic leftDate,
    dynamic lastPresentDate,
  }) =>
      Extra(
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        studentEmail: studentEmail ?? this.studentEmail,
        studentMobile: studentMobile ?? this.studentMobile,
        studentAddress: studentAddress ?? this.studentAddress,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        smsNumber: smsNumber ?? this.smsNumber,
        linkNumber: linkNumber ?? this.linkNumber,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        classId: classId ?? this.classId,
        className: className ?? this.className,
        classOrder: classOrder ?? this.classOrder,
        sectionId: sectionId ?? this.sectionId,
        sectionName: sectionName ?? this.sectionName,
        admissionDate: admissionDate ?? this.admissionDate,
        leftDate: leftDate ?? this.leftDate,
        lastPresentDate: lastPresentDate ?? this.lastPresentDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['student_id'] = studentId;
    map['student_name'] = studentName;
    map['gender'] = gender;
    map['date_of_birth'] = dateOfBirth;
    map['student_email'] = studentEmail;
    map['student_mobile'] = studentMobile;
    map['student_address'] = studentAddress;
    map['blood_group'] = bloodGroup;
    map['sms_number'] = smsNumber;
    map['link_number'] = linkNumber;
    map['branch_id'] = branchId;
    map['branch_name'] = branchName;
    map['class_id'] = classId;
    map['class_name'] = className;
    map['class_order'] = classOrder;
    map['section_id'] = sectionId;
    map['section_name'] = sectionName;
    map['admission_date'] = admissionDate;
    map['left_date'] = leftDate;
    map['last_present_date'] = lastPresentDate;
    return map;
  }
}

