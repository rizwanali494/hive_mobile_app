import 'dart:developer';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/profile/repositories/user_profile_repo.dart';
import 'package:images_picker/images_picker.dart';
import 'package:path/path.dart';

class AccountSettingVM extends ChangeNotifier {
  final userModel = GetIt.instance.get<UserModel>();
  final apiService = GetIt.instance.get<ApiService>();

  String get userImageUrl => userModel.picture?.file ?? "";
  File? image;
  final biosCtrl = TextEditingController();
  final hobbiesCtrl = TextEditingController();
  List<String> hobbies = [];
  late UserProfileRepo userProfileRepo;

  AccountSettingVM() {
    var list =
        userModel.accountData?.hobbies?.map((e) => e.name ?? "").toList() ?? [];
    hobbies = list;
    biosCtrl.text = userModel.accountData?.bio ?? "";
    userProfileRepo = UserProfileRepoImpl(apiService: apiService);
  }

  bool get hobbiesMaxed => hobbies.length >= 5;

  void setHobby() {
    String value = hobbiesCtrl.text.trim();
    if (value.isEmpty || hobbies.contains(value)) {
      hobbiesCtrl.clear();
      notifyListeners();
      return;
    }
    hobbies.add(value);
    hobbies = hobbies.toSet().toList();
    hobbiesCtrl.clear();
    notifyListeners();
  }

  void removeHobby(String value) {
    hobbies.remove(value);
    notifyListeners();
  }

  void setImage(BuildContext context) async {
    try {
      final file = await UtilFunctions.openImageTypeDialog(context);
      if (file != null) {
        image = File(file.first.path);
        String nane = basename(file.first.path);
        log(nane);
        notifyListeners();
      }
    } catch (e) {
      log("message ${e.toString()}");
      // TODO
    }
  }

  Future<void> saveChanges(BuildContext context) async {
    UtilFunctions().showLoaderDialog(context);
    try {
      String? imageId = userModel.picture?.id;
      if (image != null) {
        var fileModel =
            await userProfileRepo.uploadProfilePicture(file: image!);
        imageId = fileModel.id;
      }
      var bioBody = {"bio": biosCtrl.text};
      await userProfileRepo.updateBio(
          map: bioBody, id: userModel.accountData?.id ?? 0);
      var updateHobbies =
          await userProfileRepo.updateHobbies(map: {"hobbies": hobbies});
      log("message : ${updateHobbies.length}");
      var imageBody = {"picture": imageId};
      var model = await userProfileRepo.updateUserProfile(map: imageBody);
      log("profile updated ${model.picture?.id} Hobbies : ${model.accountData?.hobbies?.length}");
      registerUserModel(model.copyWith(
          accountData: model.accountData?.copyWith(
        hobbies: updateHobbies,
      )));
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("error : ${e.response.statusCode}");
        log("error : ${e.response.body}");
      }
      log("${e.toString()}");
    }
    context.pop();
    context.pop();
  }
}
