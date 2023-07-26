import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class InboxShimmerWidget extends StatelessWidget {
  const InboxShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final color = styles.greayShade300;

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 23,
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80.w,
                        // Customize the width of the name container
                        height: 12.h,
                        // Customize the height of the name container
                        color: color, // Customize the container color
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 35.w,
                          // Customize the width of the name container
                          height: 12.h,
                          // Customize the height of the name container
                          color: color, // Customize the container color
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Container(
                      width: 120.w,
                      // Customize the width of the time container
                      height: 12.h,
                      // Customize the height of the time container
                      color: color // Customize the container color
                      ),
                ],
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
          color: Colors.grey.shade200,
          duration: const Duration(seconds: 2),
        );
  }
}
