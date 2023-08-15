import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ServicesShimmerWidget extends StatelessWidget {
  const ServicesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final color = styles.greayShade300;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80.w,
              // Customize the width of the name container
              height: 12.h,
              // Customize the height of the name container
              color: color, // Customize the container color
            ),
            10.verticalSpace,
            Container(
              width: 120.w,
              // Customize the width of the name container
              height: 12.h,
              // Customize the height of the name container
              color: color, // Customize the container color
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
                width: 40.w,
                // Customize the width of the time container
                height: 12.h,
                // Customize the height of the time container
                color: color // Customize the container color
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
