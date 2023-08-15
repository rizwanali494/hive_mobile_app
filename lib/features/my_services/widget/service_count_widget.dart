import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ServiceCountWidget extends StatelessWidget {
  final String count;
  final String type;
  final Color color;

  const ServiceCountWidget({
    super.key,
    required this.count,
    required this.type,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 25.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.r,
          ),
          border: Border.all(
            color: color,
          ),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: styles.inter20w700.copyWith(color: color),
            ),
            Text(
              type,
              style: styles.inter12w400.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
