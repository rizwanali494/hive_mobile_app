import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

class ActivityStatusWidget extends StatelessWidget {
  final String iconPath;
  final String title;

  const ActivityStatusWidget({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Container(
      width: 106.w,
      height: 29.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: styles.skyBlue,
        ),
      ),
      child: Center(
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  styles.skyBlue,
                  BlendMode.srcIn,
                ),
              ),
              8.horizontalSpace,
              Text(
                title,
                style: styles.inter12w400.copyWith(color: styles.skyBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
