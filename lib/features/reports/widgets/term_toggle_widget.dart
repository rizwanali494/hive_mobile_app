import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class TermToggleWidget extends StatelessWidget {
  final bool isSelected;
  final String text;

  const TermToggleWidget({
    super.key,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
          color: isSelected ? styles.paleBlue : styles.white,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: styles.skyBlue)),
      child: Center(
        child: Text(
          text,
          style: styles.inter10w600.copyWith(
            color: styles.skyBlue,
          ),
        ),
      ),
    );
  }
}
