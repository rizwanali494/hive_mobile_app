import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class ShowMoreButton extends StatelessWidget {
  final bool hasAll;
  final bool isLoading;
  final Function()? onTap;

  const ShowMoreButton({
    super.key,
    required this.styles,
    required this.hasAll,
    this.onTap,
    required this.isLoading,
  });

  final AppTheme styles;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SliverToBoxAdapter(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        )),
      );
    }

    if (hasAll) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: Text(
            "Show More",
            style: styles.inter12w400.copyWith(color: styles.skyBlue),
          ),
        ),
      ),
    );
  }
}
