import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class NotificationShimmerWidget extends StatelessWidget {
  const NotificationShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final color = styles.greayShade300;
    return Row(
      children: [
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(6.r)),
        ),
        24.horizontalSpace,
        Container(
          width: 100.w,
          height: 12.h,
          decoration: BoxDecoration(color: color),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 40.w,
              height: 12.h,
              decoration: BoxDecoration(color: color),
            ),
          ),
        ),
      ],
    )
        .animate(
          onComplete: (controller) => controller.repeat(),
        )
        .shimmer(
          color: Colors.grey.shade200,
          duration: const Duration(seconds: 2),
        );
  }
}
