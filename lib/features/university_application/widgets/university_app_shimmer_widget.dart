import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class UniversityAppShimmer extends StatelessWidget {
  const UniversityAppShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final color = styles.greayShade300;

    return Padding(
      padding: EdgeInsets.symmetric(
          // vertical: 5.h,
          horizontal: 5.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: color,
                        ),
                      ),
                      4.verticalSpace,
                      Container(
                        width: 70.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: color,
                        ),
                      ),
                      4.verticalSpace,
                      Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 40.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(36.r)),
                ),
              ),
            ],
          ),
        ],
      )
          .animate(
            onComplete: (controller) => controller.repeat(),
          )
          .shimmer(
            color: styles.greyShade200,
            duration: const Duration(seconds: 2),
          ),
    );
  }
}
