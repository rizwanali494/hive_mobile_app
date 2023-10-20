import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/my_services/view_models/service_widget_vm.dart';

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
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: styles.inter14w600.copyWith(
                  color: styles.darkSlateGrey,
                ),
              ),
            ),
            10.horizontalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Text(
                    controller.time,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: styles.inter10w400.copyWith(
                      color: styles.darkGrey,
                    ),
                  ),
                ),
                22.horizontalSpace,
                ColoredBox(
                  color: color(styles),
                  child: SizedBox(
                    width: 7.w,
                    height: 31.h,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          controller.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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

  Color color(AppTheme styles) =>
      controller.isOpen ? styles.green : styles.lightOrange;
}
