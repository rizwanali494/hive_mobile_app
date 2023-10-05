import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class YearToggleWidget extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final bool isSelected;
  final String text;

  const YearToggleWidget({
    super.key,
    required this.borderRadius,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: isSelected ? styles.skyBlue : styles.whiteSmoke,
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          text,
          style: styles.inter10w600
              .copyWith(color: isSelected ? styles.white : styles.black),
        ),
      ),
    );
  }
}
