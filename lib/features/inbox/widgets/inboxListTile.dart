import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/network_images.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class InboxListTile extends StatelessWidget {
  const InboxListTile({
    super.key,
    this.onTap,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.iconColor,
    this.contentPadding,
  });

  final VoidCallback? onTap;
  final String title;
  final String subTitle;
  final Widget? trailing;
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
            title,
            style: titleTextStyle,
          ),
          3.verticalSpace,
          Text(
            subTitle,
            style: styles.inter10w400,
          ),
        ],
      ),
      trailing: trailing ?? const SizedBox.shrink(),
    );
  }
}