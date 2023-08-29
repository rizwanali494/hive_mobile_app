import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ExternalGradeShimmerWidget extends StatelessWidget {
  const ExternalGradeShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final color = styles.greayShade300;
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 100.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        15.horizontalSpace,
        Expanded(
          flex: 2,
          child: Container(
            width: 100.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        25.horizontalSpace,
        Expanded(
          child: Container(
            width: 100.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        15.horizontalSpace,
        Expanded(
          child: Container(
            width: 100.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    )
        .animate(
          onComplete: (controller) => controller.repeat(),
        )
        .shimmer(
          color: styles.greyShade200,
          duration: const Duration(seconds: 2),
        );
  }
}
