import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/resources/app_theme.dart';

class DividerAppBar extends StatelessWidget {
  final String title;

  const DividerAppBar({
    super.key,
    required this.title,
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
        7.verticalSpace,
        Divider(
          color: styles.black.withOpacity(0.2),
        ),
      ],
    );
  }
}
