import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class DividerAppBar extends StatelessWidget {
  final String title;
  final bool showDivider;

  const DividerAppBar({
    super.key,
    required this.title,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              15.horizontalSpace,
              Text(
                title,
                style: styles.inter20w700,
              ),
            ],
          ),
        ),
        if (showDivider) ...[
          7.verticalSpace,
          Divider(
            color: styles.black.withOpacity(0.2),
          ),
        ],
      ],
    );
  }
}
