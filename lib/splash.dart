
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/get_it/api_service_instance.dart';
import 'package:hive_mobile/app/get_it/user_model_instance.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/services/local_services/isar_service.dart';
import 'package:hive_mobile/features/authentication/screens/sign_in_screen.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      check(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            debugPrint("tapped");
          },
          // child: SvgPicture.asset(
          //   SvgIcons.arrowRight,
          //   semanticsLabel: 'A red up arrow',
          //   width: 200,
          //   height: 300,
          // ),
          child: Image.asset(
            SvgIcons.hiveLogo,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }

  final getit = GetIt.instance;
  final sharedPref = GetIt.instance.get<SharedPreferences>();
  final isarService = IsarService<UserModel>();

  void check(BuildContext context) async {
    String? token = await sharedPref.getString("token");
    if (token != null && token.trim().isNotEmpty) {
      registerApiServiceInstance(token: token);
      final userModel = await isarService.findFirst();
      if (userModel != null) {
        registerUserModel(userModel);
        navigate(context, HomeScreen.route);
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
