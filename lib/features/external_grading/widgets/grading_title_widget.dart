import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class GradingTitleWidget extends StatelessWidget {
  final String title;
  final int flex;

  const GradingTitleWidget({
    super.key,
    required this.title,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Center(
      child: Text(
        title,
        style: styles.inter12w400,
        textAlign: TextAlign.center,
      ),
    );
  }
}
