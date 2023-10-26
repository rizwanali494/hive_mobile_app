import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/view_models/splash_vm.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SplashVM(context: context),
      lazy: false,
      child: Scaffold(
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
      ),
    );
  }
}
