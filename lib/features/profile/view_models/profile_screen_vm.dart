import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';

class ProfileScreenVM extends ChangeNotifier {

  UserModel get userModel {
    return GetIt.instance.get<UserModel>();
  }

  String get userName {
    return userModel.accountData?.extra?.studentName ?? "";
  }

  String get userBio {
    return userModel.accountData?.status ?? "";
  }

  String get userImage {
    return userModel.picture?.file ?? "";
  }

  String get dateOfBirth {
    return userModel.accountData?.extra?.dateOfBirth ?? "";
  }

  String get gender {
    return userModel.accountData?.extra?.gender ?? "";
  }

  String get branchName {
    return userModel.accountData?.extra?.branchName ?? "";
  }

  List get hobbies {
    return userModel.accountData?.hobbies ?? <String>[];
  }



}
