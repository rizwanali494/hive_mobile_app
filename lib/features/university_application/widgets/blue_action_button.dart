import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

class BlueActionButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const BlueActionButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: styles.skyBlue,
          borderRadius: BorderRadius.circular(
            28,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: styles.inter16w400.copyWith(
                  color: styles.white,
                ),
              ),
              SvgPicture.asset(SvgIcons.addSquare),
            ],
          ),
        ),
      ),
    );
  }
}
