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
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 50.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: color,
              ),
            ),
            15.horizontalSpace,
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 30.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: color,
                      ),
                    ),
                    5.horizontalSpace,
                    Container(
                      width: 25.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(36.r),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Container(
            //     width: 100.w,
            //     height: 12.h,
            //     decoration: BoxDecoration(
            //       color: color,
            //       borderRadius: BorderRadius.circular(6),
            //     ),
            //   ),
            // ),
            // 25.horizontalSpace,
            // Expanded(
            //   child: Container(
            //     width: 100.w,
            //     height: 12.h,
            //     decoration: BoxDecoration(
            //       color: color,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),
            // 15.horizontalSpace,
            // Expanded(
            //   child: Container(
            //     width: 100.w,
            //     height: 12.h,
            //     decoration: BoxDecoration(
            //       color: color,
            //       borderRadius: BorderRadius.circular(4),
            //     ),
            //   ),
            // ),
          ],
        ),
        Divider(
          thickness: 0.5,
          color: styles.black.withOpacity(0.5),
        ),
      ],
    ).animate(
      onComplete: (controller) => controller.repeat(),
    )
        .shimmer(
      color: styles.greyShade200,
      duration: const Duration(seconds: 2),
    );
  }
}
