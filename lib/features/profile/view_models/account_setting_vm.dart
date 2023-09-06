import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_mobile/app/models/data/user_model.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:images_picker/images_picker.dart';
import 'package:provider/provider.dart';

class AccountSettingVM extends ChangeNotifier {
  final userModel = GetIt.instance.get<UserModel>();

  String get userImageUrl => userModel.picture?.file ?? "";

  File? image;
  final biosCtrl = TextEditingController();
  final hobbiesCtrl = TextEditingController();
  List<String> hobbies = [];

  void setImage(BuildContext context) async {
    List<Media>? file = await UtilFunctions.openImageTypeDialog(context);
    if (file != null) {
      log("file picked");
      image = File(file.first.path);
      notifyListeners();
    }
  }
}
