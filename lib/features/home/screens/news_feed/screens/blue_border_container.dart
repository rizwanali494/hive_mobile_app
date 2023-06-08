import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class BlueBorderContainer extends StatelessWidget {
  final Widget child;

  const BlueBorderContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 75.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: appTheme(context).skyBlue),
      ),
      child: child,
    );
  }
}
