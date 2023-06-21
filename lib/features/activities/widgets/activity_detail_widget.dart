import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

class ActivityDetailWidget extends StatelessWidget {
  final String iconPath;
  final String title;

  const ActivityDetailWidget(
      {Key? key, required this.iconPath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 14.h
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          8.8.horizontalSpace,
          Expanded(
            child: Text(
              title,
              style: styles.inter12w500,
            ),
          )
        ],
      ),
    );
  }
}
