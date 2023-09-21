import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ReportTextColumn extends StatelessWidget {
  const ReportTextColumn({
    super.key,
    required this.context,
    required this.heading,
    required this.description,
  });

  final BuildContext context;
  final String heading;
  final String description;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 3.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: styles.inter8w600,
          ),
          Text(
            description,
            style: styles.inter8w400,
          ),
        ],
      ),
    );
  }
}
