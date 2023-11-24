import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/notification/view_models/notfication_tile_vm.dart';

class NotificationTile extends StatefulWidget {
  final NotificationTileVM controller;

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
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
      onTap: widget.onTap,
      contentPadding: EdgeInsets.only(
        top: 5.h,
        bottom: 5.h,
      ),
      leading: SvgPicture.asset(
        widget.svgIconPath,
        height: 17.h,
        width: 17.w,
        colorFilter: widget.iconColor != null
            ? ColorFilter.mode(widget.iconColor!, BlendMode.srcIn)
            : null,
      ),
      title: Text(
        widget.controller.title,
        style: titleTextStyle,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.controller.trailing,
            style: styles.inter10w400
                .copyWith(color: styles.black.withOpacity(0.5)),
          ),
          if (!(widget.controller.model.isRead ?? true)) ...[
            2.verticalSpace,
            CircleAvatar(
              radius: 3,
              backgroundColor: styles.green,
            ),
          ]
        ],
      ),
    );
  }
}
