import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class DividerAppBar extends StatelessWidget {
  final String title;
  final bool showDivider;
  final TextStyle? titleStyle;
  final Widget? actionButton;

  const DividerAppBar({
    super.key,
    required this.title,
    this.showDivider = true,
    this.titleStyle,
    this.actionButton,
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
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle ?? styles.inter20w700,
                ),
              ),
              if (actionButton != null) actionButton!,
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
