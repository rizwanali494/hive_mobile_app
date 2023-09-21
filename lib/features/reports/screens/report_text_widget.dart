import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ReportTextWidget extends StatelessWidget {
  const ReportTextWidget({
    super.key,
    required this.context,
    required this.width,
    required this.text,
  });

  final BuildContext context;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Container(
      width: width,
      child: Text(
        text,
        style: styles.inter7w600.copyWith(color: styles.white),
      ),
    );
  }
}
