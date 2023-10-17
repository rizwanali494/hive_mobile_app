import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class AuthButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String svgIcon;
  final String text;

  const AuthButtonWidget({
    super.key,
    this.onTap,
    required this.svgIcon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 9.h),
        margin: EdgeInsets.symmetric(horizontal: 42.w),
        decoration: BoxDecoration(
            color: styles.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgIcon,
              width: 19.w,
              height: 19.h,
            ),
            SizedBox(
              width: 13.w,
            ),
            Text(
              text,
              style: styles.inter15w400.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
