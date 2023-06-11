import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.icon,
    required this.isSelected,
  });

  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: isSelected ? styles.lightBlue : null,
      ),
      margin: const EdgeInsets.
      symmetric(horizontal: 5),
      padding: const EdgeInsets.all(8),
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          isSelected
              ? styles.deepSkyBlue
              : styles.black.withOpacity(0.5),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}