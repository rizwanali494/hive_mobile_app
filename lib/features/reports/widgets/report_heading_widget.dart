import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ReportHeadingWidget extends StatelessWidget {
  const ReportHeadingWidget({
    super.key,
    required this.context,
    required this.heading,
    required this.flex,
  });

  final BuildContext context;
  final String heading;
  final int flex;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Text(
      heading,
      style: styles.inter7w600.copyWith(
        color: styles.white,
      ),
    );
  }
}
