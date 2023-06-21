import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ReportListTile extends StatelessWidget {
  const ReportListTile({
    super.key,
     this.onTap,
    required this.title,
    required this.trailing,
    required this.date,
    this.iconColor,
  });

  final VoidCallback? onTap;
  final String title;
  final String date;
  final Widget trailing;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final titleTextStyle = styles.inter14w600.copyWith(fontWeight: FontWeight.w500);
    // return ListTile(
    //   visualDensity: const VisualDensity(vertical: -4, horizontal: 0.0),
    //   minVerticalPadding: 0.h,
    //   minLeadingWidth: 0,
    //   horizontalTitleGap: 29.w,
    //   onTap: onTap,
    //   contentPadding: EdgeInsets.only(
    //     top: 5.h,
    //     bottom: 5.h,
    //   ),
    //   title: Row(
    //     children: [
    //       Text(
    //         title,
    //         style: titleTextStyle,
    //       ),
    //       50.horizontalSpace,
    //       Text(
    //         date,
    //         style: titleTextStyle,
    //       ),
    //     ],
    //   ),
    //   trailing:trailing ,
    // );
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: titleTextStyle,
          ),
        ),
        // 137.horizontalSpace,
        Expanded(
          flex: 2,
          child: Text(
            date,
            style: titleTextStyle,
          ),
        ),
        // 78.horizontalSpace,,
        Expanded(
          child: Align(alignment: Alignment.topLeft,child: trailing),
        ),

      ],
    );
  }
}