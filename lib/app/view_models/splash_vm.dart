import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/get_it/api_service_instance.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/app/services/user_verrification_service/user_verfication_handler.dart';
import 'package:hive_mobile/features/authentication/screens/sign_in_screen.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashVM extends ChangeNotifier with UserVerificationHandler {
  final getit = GetIt.instance;
  final sharedPref = GetIt.instance.get<SharedPreferences>();
  final isarService = IsarService<UserModel>();

  BuildContext context;

  SplashVM({required this.context}) {
    check(context);
  }

  void check(BuildContext context) async {
    String? token = await sharedPref.getString("token");
    if (token != null && token.trim().isNotEmpty) {
      registerApiServiceInstance(token: token);
      final userModel = await isarService.findFirst();
      if (userModel != null) {
        await registerUserModel(userModel);
        // navigate(context, HomeScreen.route);
        checkEmailVerification(context);
        return;
      } else {
        navigate(context, SignInScreen.route);
        return;
      }
    } else {
      registerApiServiceInstance();
    }
    navigate(context, SignInScreen.route);
  }

  void navigate(BuildContext context, String route) {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      context.pushReplacement(kIsWeb ? HomeScreen.route : route);
    });
  }
}
