import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

class ApplicationStatusWidget extends StatelessWidget {
  final bool isSelected;
  final Function()? onTap;
  final String title;
  final String iconPath;
  final double? spaceBetween;

  const ApplicationStatusWidget({
    super.key,
    required this.isSelected,
    required this.title,
    required this.iconPath,
    this.spaceBetween,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110.w,
        padding: EdgeInsets.symmetric(
          vertical: 6.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? styles.skyBlue : styles.black.withOpacity(.2),
          borderRadius: BorderRadius.circular(
            36,
          ),
        ),
        child: Row(
          children: [
            16.horizontalSpace,
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isSelected ? styles.white : styles.black.withOpacity(.2),
                BlendMode.srcIn,
              ),
            ),
            spaceBetween?.horizontalSpace ?? 12.horizontalSpace,
            Text(
              title,
              style: styles.inter12w400.copyWith(
                  color:
                      isSelected ? styles.white : styles.black.withOpacity(.2)),
            )
          ],
        ),
      ),
    );
  }
}
