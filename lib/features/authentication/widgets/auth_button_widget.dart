import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/constants/svg_icons.dart';
import 'package:hive_mobile/res/app_strings.dart';

import '../../../res/app_theme.dart';

class AuthButtonWidget extends StatelessWidget {
  final Function()? onTap;

  const AuthButtonWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 9.h),
        margin: EdgeInsets.symmetric(horizontal: 42.w),
        decoration: BoxDecoration(
            color: appTheme(context).white,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgIcons.googleIcon),
            SizedBox(
              width: 13.w,
            ),
            Text(
              AppStrings.continueWithGoogle,
              style: appTheme(context).inter15w400.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
