import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/constants/svg_icons.dart';
import 'package:hive_mobile/features/authentication/widgets/auth_button_widget.dart';
import 'package:hive_mobile/res/app_strings.dart';

import '../../../res/app_theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SvgPicture.asset(SvgIcons.hiveLogo,width: 193.w,height: 98.h,),
            Expanded(
              child: Image.asset(
                SvgIcons.hiveLogo,
                width: 193.w,
                height: 98.h,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: containerRadius,
                    topRight: containerRadius,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colors(context).linearBlueGradientTopLeft,
                      colors(context).linearBlueGradientBottomRight,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 50,
                        color: Colors.white.withOpacity(0.25),
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                        blurStyle: BlurStyle.outer),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.welcome,
                      style: colors(context).inter50w700,
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Text(
                      AppStrings.signInWithGoogle,
                      style: colors(context).inter12w400,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    const AuthButtonWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final containerRadius = const Radius.circular(50);
}
