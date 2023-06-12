import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:provider/provider.dart';

import '../view_models/home_screen_vm.dart';

class AppBarWidget extends StatelessWidget {
  final Function()? onMenuTap;
  final Color color;
  final String title;
  final TextStyle? titleStyle;
  final List<Widget> actions;
  final Widget? icon;

  const AppBarWidget({
    super.key,
    this.onMenuTap,
    required this.color,
    this.titleStyle,
    this.actions = const [],
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final provider = context.read<HomeScreenVm>();

    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20.h,
          left: 19.w,
          right: 20.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: onMenuTap ??
                () {
                  provider.openDrawer();
                },
            child: icon ??
                Icon(
                  Icons.menu,
                  color: color,
                  size: 40.w,
                ),
          ),
          16.5.horizontalSpace,
          Text(
            title,
            style: titleStyle?.copyWith(color: color) ??
                styles.inter40w700.copyWith(color: color),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [...actions],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
