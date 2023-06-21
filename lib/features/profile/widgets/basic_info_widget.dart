import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

class BasicInfoWidget extends StatelessWidget {
  final String title;
  final String info;
  final String iconPath;

  const BasicInfoWidget({
    super.key,
    required this.title,
    required this.info,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(iconPath),
        13.horizontalSpace,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info,
                style: styles.inter12w500,
              ),
              Text(
                title,
                style: styles.inter9w400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
