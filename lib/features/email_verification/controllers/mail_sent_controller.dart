import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/repositories/user_repository.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/email_verification/screens/email_verification_screen.dart';

class MailSentController extends ChangeNotifier {
  bool isLoading = false;
  final apiService = GetIt.instance.get<ApiService>();
  final userModel = GetIt.instance.get<UserModel>();

  bool get isVerified => userModel.isEmailVerified ?? false;
  final userIsarService = IsarService<UserModel>();

  late final userProfileService = UserRepository(apiService: apiService);

  Future<void> checkStatus() async {
    isLoading = true;
    notifyListeners();
    try {
      final userModel = await userProfileService.fetchProfile();
      registerUserModel(userModel);
      userIsarService.put(userModel);
    } catch (e) {
      UtilFunctions.showToast();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> resendEmail({required String email}) async {
    final body = {
      "backup_email": email,
    };
    isLoading = true;
    notifyListeners();
    try {
      await userProfileService.updateBackupEmail(body: body, id: 0);
    } catch (e) {
      // TODO
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> changeEmail(BuildContext context) async {
    context.pushReplacement(EmailVerificationScreen.route);
  }
}
