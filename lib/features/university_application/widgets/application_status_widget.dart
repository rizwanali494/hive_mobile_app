import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view_models/base_status_controller.dart';

class ApplicationStatusWidget extends StatelessWidget {
  final BaseStatusController controller;

  final ApplicationState? applicationStatus;

  const ApplicationStatusWidget({
    super.key,
    required this.applicationStatus,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          // color: styles.paleWhite,
          color: controller.bgColor,
          borderRadius: BorderRadius.circular(36),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 11.w,
          vertical: 5.h,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            3.horizontalSpace,
            // SvgPicture.asset(SvgIcons.tickSquare),
            SvgPicture.asset(controller.icon),
            7.horizontalSpace,
            Text(
              controller.title,
              style: styles.inter12w400,
            ),
          ],
        ),
      ),
    );

    if (ApplicationState.accepted == applicationStatus) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: styles.paleWhite,
            borderRadius: BorderRadius.circular(36),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 11.w,
            vertical: 5.h,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              3.horizontalSpace,
              // SvgPicture.asset(SvgIcons.tickSquare),
              SvgPicture.asset(controller.icon),
              10.horizontalSpace,
              Text(
                controller.title,
                style: styles.inter12w400,
              ),
            ],
          ),
        ),
      );
    } else if (ApplicationState.applied == applicationStatus) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: styles.lightCyan,
            borderRadius: BorderRadius.circular(36),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 11.w,
            vertical: 5.h,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              3.horizontalSpace,
              SvgPicture.asset(SvgIcons.applied),
              10.horizontalSpace,
              Text(
                AppStrings.applied,
                style: styles.inter12w400,
              ),
            ],
          ),
        ),
      );
    } else if (ApplicationState.rejected == applicationStatus) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: styles.lightPink,
            borderRadius: BorderRadius.circular(36),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 11.w,
            vertical: 5.h,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              3.horizontalSpace,
              SvgPicture.asset(SvgIcons.undecided),
              10.horizontalSpace,
              Text(
                AppStrings.rejected,
                style: styles.inter12w400,
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }
}
