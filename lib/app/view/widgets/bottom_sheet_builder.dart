import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

/// A bottom sheet builder that implements cupertino style divider on top of it.
/// and requires a [body] [Widget] to build up actual widget.
class BottomSheetBuilder extends StatelessWidget {
  final Widget body;
  final EdgeInsets padding;

  const BottomSheetBuilder({
    super.key,
    required this.body,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8.h),
          Container(
            width: 36.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.2),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SingleChildScrollView(
            child: Padding(padding: padding, child: body),
          ),
        ],
      ),
    );
  }
}