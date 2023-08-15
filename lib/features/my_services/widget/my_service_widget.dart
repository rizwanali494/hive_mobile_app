import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/inbox/view_models/service_widget_vm.dart';

class MyServiceWidget extends StatelessWidget {
  final ServiceWidgetVM controller;

  const MyServiceWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                controller.title,
                style: styles.inter14w600.copyWith(
                  color: styles.darkSlateGrey,
                ),
              ),
            ),
            Text(
              controller.time,
              style: styles.inter10w400.copyWith(
                color: styles.darkGrey,
              ),
            ),
          ],
        ),
        Text(
          controller.description,
          style: styles.inter10w400.copyWith(
            color: styles.darkGrey,
          ),
        ),
        12.verticalSpace,
        Divider(
          color: styles.black.withOpacity(.2),
        ),
      ],
    );
  }
}
