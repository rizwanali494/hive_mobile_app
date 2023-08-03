import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class BlueBorderContainer extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final bool isSelected;

  const BlueBorderContainer({
    super.key,
    this.onTap,
    required this.child,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 75.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: isSelected ? styles.paleBlue : null,
          border: Border.all(color: styles.skyBlue),
        ),
        child: child,
      ),
    );
  }
}
