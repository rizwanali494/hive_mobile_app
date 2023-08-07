import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/network_images.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/inbox/view_models/inboxtile_widget_vm.dart';

class InboxListTile extends StatelessWidget {
  final InboxTileWidgetVM controller;

  const InboxListTile({
    super.key,
    this.onTap,
    this.iconColor,
    this.contentPadding,
    required this.controller,
  });

  final VoidCallback? onTap;
  final Color? iconColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final titleTextStyle = styles.inter14w600;
    return ListTile(
      visualDensity: const VisualDensity(
        horizontal: 0.0,
      ),
      minVerticalPadding: 0.h,
      minLeadingWidth: 0,
      horizontalTitleGap: 16.w,
      onTap: onTap,
      contentPadding: contentPadding ??
          EdgeInsets.only(
            top: 5.h,
            bottom: 5.h,
          ),
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          NetworkImages.userUrl,
        ),
        radius: 23,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.name,
            style: titleTextStyle,
          ),
          3.verticalSpace,
          Text(
            controller.content,
            style: styles.inter10w400.copyWith(
              color: styles.darkGrey,
            ),
          ),
        ],
      ),
      // trailing: trailing ?? const SizedBox.shrink(),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            controller.time,
            style: styles.inter10w400
                .copyWith(color: styles.black.withOpacity(0.5)),
          ),
          7.verticalSpace,
          Container(
            height: 7.h,
            width: 7.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: styles.linearBlueGradientTopLeft,
            ),
          ),
        ],
      ),
    );
  }
}