import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

class ApplicationStatusWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String iconPath;

  const ApplicationStatusWidget({
    super.key,
    required this.title,
    required this.color,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(36),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 11.w,
        vertical: 5.h,
      ),
      child: Row(
        children: [
          3.horizontalSpace,
          SvgPicture.asset(iconPath),
          10.horizontalSpace,
          Text(
            title,
            style: styles.inter12w400,
          ),
        ],
      ),
    );
  }
}
