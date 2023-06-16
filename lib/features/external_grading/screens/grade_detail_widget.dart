import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class GradeDetailWidget extends StatelessWidget {
  final String title;

  const GradeDetailWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.h,
      ),
      child: Text(
        "$title: ",
        style: styles.inter14w400.copyWith(
          color: styles.darkSlateGrey,
        ),
      ),
    );
  }
}
// Text(
// description,
// style: styles.inter16w700,
// ),
