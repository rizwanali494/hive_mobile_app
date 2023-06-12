import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/resources/app_theme.dart';

class BlueTextWidget extends StatelessWidget {
  final String title;
  final Widget? icon;

  const BlueTextWidget({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6.h,
        horizontal: 7.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: styles.skyBlue,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: icon,
            ),
          Text(
            title,
            style: styles.inter12w400.copyWith(
              color: styles.skyBlue,
            ),
          ),
        ],
      ),
    );
  }
}
