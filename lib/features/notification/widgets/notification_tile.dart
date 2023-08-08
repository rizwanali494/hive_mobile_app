import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/notification/view_models/notfication_tile_vm.dart';

class NotificationTile extends StatelessWidget {
  final NotificationTimeVM controller;

  const NotificationTile({
    super.key,
    required this.onTap,
    required this.svgIconPath,
    this.iconColor,
    required this.controller,
  });

  final VoidCallback onTap;
  final String svgIconPath;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final titleTextStyle =
    styles.inter14w600.copyWith(fontWeight: FontWeight.w500);
    return ListTile(
      visualDensity: const VisualDensity(vertical: -3, horizontal: 0.0),
      // minVerticalPadding: 20.h,
      minLeadingWidth: 0,
      horizontalTitleGap: 29.w,
      onTap: onTap,
      contentPadding: EdgeInsets.only(
        top: 5.h,
        bottom: 5.h,
      ),
      leading: SvgPicture.asset(
        svgIconPath,
        height: 17.h,
        width: 17.w,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
      ),
      title: Text(
        controller.title,
        style: titleTextStyle,
      ),
      trailing: Text(
        controller.trailing,
        style:
            styles.inter10w400.copyWith(color: styles.black.withOpacity(0.5)),
      ),
    );
  }
}
