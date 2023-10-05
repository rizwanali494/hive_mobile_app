import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class TermDividerWidget extends StatelessWidget {
  const TermDividerWidget({
    super.key,
    required this.styles,
  });

  final AppTheme styles;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: VerticalDivider(
        color: styles.black.withOpacity(0.5),
        width: 0.5.w,
        thickness: 0.5.w,
      ),
    );
  }
}
