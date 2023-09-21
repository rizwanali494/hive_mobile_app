import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class YearRowWidget extends StatelessWidget {
  const YearRowWidget({
    super.key,
    required this.context,
    required this.color,
    required this.text,
  });

  final BuildContext context;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Row(
      children: [
        Container(
          width: 6.w,
          height: 6.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        3.horizontalSpace,
        Text(
          text,
          style: styles.inter10w600,
        ),
      ],
    );
  }
}
