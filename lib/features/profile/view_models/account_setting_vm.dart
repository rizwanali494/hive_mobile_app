import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/exceptions/base_exception_controller.dart';
import 'package:hive_mobile/app/exceptions/http_status_code_exception.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/account_picture_model.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/attachments_model.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/profile/repositories/user_profile_repo.dart';
import 'package:path/path.dart';

class AccountSettingVM extends ChangeNotifier with BaseExceptionController {
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
    biosCtrl.text = userModel.accountData?.status ?? "";
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
      final file =
          await UtilFunctions.openImageTypeDialog(context, imageCount: 1);
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
      Attachments fileModel =
          Attachments.fromJson(userModel.picture?.toJson() ?? {});
      if (image != null) {
        fileModel = await userProfileRepo.uploadProfilePicture(file: image!);
      }
      var bioText = biosCtrl.text;
      var bioBody = {"status": bioText};
      await userProfileRepo.updateBio(
          map: bioBody, id: userModel.accountData?.id ?? 0);
      var updateHobbies =
          await userProfileRepo.updateHobbies(map: {"hobbies": hobbies});
      var imageBody = {"picture": fileModel.id};
      await userProfileRepo.updateUserProfile(map: imageBody);
      var accountHobbies = userModel.accountData?.hobbies
          ?.where((element) => hobbies.contains(element.name))
          .toList();
      accountHobbies?.addAll([...updateHobbies]);
      final updatedUserModel = userModel.copyWith(
        picture: AccountPicture.fromJson(fileModel.toJson()),
        accountData: userModel.accountData?.copyWith(
          hobbies: accountHobbies,
          bio: bioText,
        ),
      );

      registerUserModel(updatedUserModel);
      localService.deleteAndPut(updatedUserModel, updatedUserModel.id ?? 0);
      UtilFunctions.showToast(msg: AppStrings.profileUpdated);
    } catch (e) {
      if (e is HTTPStatusCodeException) {
        log("error : ${e.response.statusCode}");
        log("error : ${e.response.body}");
      }
      handleException(e);
      log("${e.toString()}");
    }

    context.pop();
    context.pop();
  }

  final localService = IsarService<UserModel>();
}
