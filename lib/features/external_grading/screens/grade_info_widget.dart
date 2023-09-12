import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class GradeInfoDescription extends StatelessWidget {
  final String description;

  const GradeInfoDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(bottom: 4.5.h),
      child: Text(
        description,
        style: styles.inter16w700,
      ),
    );
  }
}
