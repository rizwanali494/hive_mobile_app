import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';

class HobbyChipWidget extends StatelessWidget {
  final String text;

  const HobbyChipWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        badgeColor: styles.greyWhite,
      ),
      position: badges.BadgePosition.topEnd(end: -5),
      badgeContent: Icon(
        Icons.close,
        size: 10,
        color: styles.darkGrey,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 6.h,
          horizontal: 12.w,
        ),
        decoration: BoxDecoration(
          color: styles.greyWhite,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: styles.inter12w400.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
