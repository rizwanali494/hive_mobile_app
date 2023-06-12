import 'package:flutter/material.dart';

import '../../resources/app_theme.dart';

class BlueElevatedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const BlueElevatedButton({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ElevatedButton(
      onPressed: onTap??(){},
      style: ElevatedButton.styleFrom(
        backgroundColor: styles.skyBlue,
      ),
      child: Text(
        text,
        style: styles.inter12w700.copyWith(color: styles.white),
      ),
    );
  }
}
