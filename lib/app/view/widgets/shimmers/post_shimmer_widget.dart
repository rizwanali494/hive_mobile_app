import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class PostShimmerWidget extends StatelessWidget {
  final PostType type;
  final double? horizontalPadding;

  const PostShimmerWidget({
    super.key,
    required this.type,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    var selected = "1";
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding?.w ?? 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: styles.white,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          5.verticalSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor:
                    buildGrey(), // Customize the avatar background color
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.w, // Customize the width of the name container
                    height: 12.h, // Customize the height of the name container
                    color: buildGrey(), // Customize the container color
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    width: 20.w, // Customize the width of the time container
                    height: 8.h, // Customize the height of the time container
                    color: buildGrey(), // Customize the container color
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 12.h,
                  color: buildGrey(), // Customize the container color
                ),
                10.verticalSpace,
                Container(
                  width: 200.w,
                  height: 12.h,
                  color: buildGrey(), // Customize the container color
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 23.h, bottom: 13.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 333.w,
                height: 221.h,
                color: buildGrey(),
              ),
            ),
          ),
          Row(
            children: [
              const RoundContainerShimmer(),
              9.horizontalSpace,
              const RoundContainerShimmer(),
            ],
          ),
        ],
      ),
    )
        .animate(
          onComplete: (controller) => controller.repeat(),
        )
        .shimmer(
          color: Colors.grey.shade200,
          duration: const Duration(seconds: 2),
        );
  }

  Color buildGrey() => Colors.grey.shade300;
}

class RoundContainerShimmer extends StatelessWidget {
  const RoundContainerShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(28),
      ),
      height: 30.h,
    );
  }
}
