import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';

class DaysEventScreen extends StatefulWidget {
  final DateTime date;

  static const route = "/DaysEvent";

  const DaysEventScreen({super.key, required this.date});

  @override
  State<DaysEventScreen> createState() => _DaysEventScreenState();
}

class _DaysEventScreenState extends State<DaysEventScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          children: [
            DividerAppBar(
                title: widget.date.eventDayFormat,
                titleStyle: styles.inter20w600),
            15.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: styles.paleSkyBlue,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  Expanded(child: headingText("Event Name")),
                  Expanded(child: headingText("Time")),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: headingText("Location"),
                    ),
                  ),
                ],
              ),
            ),
            17.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Expanded(
                    child: descriptionText("Event Name"),
                  ),
                  Expanded(
                    child: descriptionText("Time"),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: descriptionText("Location"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headingText(String text) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Text(
      text,
      style: styles.inter14w600,
    );
  }

  Widget descriptionText(String text) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Text(
      text,
      style: styles.inter14w400,
    );
  }
}
