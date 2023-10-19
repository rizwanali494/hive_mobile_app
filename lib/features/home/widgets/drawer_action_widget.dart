import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class DrawerActionWidget extends StatelessWidget {
  final String icon;
  final String actionName;

  const DrawerActionWidget({
    super.key,
    required this.icon,
    required this.actionName,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Padding(
      padding: EdgeInsets.only(bottom: 28.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              styles.deepSkyBlue,
              BlendMode.srcIn,
            ),
          ),
          19.horizontalSpace,
          Expanded(
            child: Text(
              actionName,
              style: styles.inter15w400,
            ),
          ),
        ],
      ),
    );
  }
}
