import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/get_it/api_service_instance.dart';
import 'package:hive_mobile/features/authentication/screens/sign_in_screen.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';

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
      navigate(context);
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

  void navigate(BuildContext context) {
    registerApiServiceInstance();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      context.pushReplacement(kIsWeb ? HomeScreen.route : SignInScreen.route);
    });
  }
}
