import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/calender/screens/week_days_widget.dart';
import 'package:hive_mobile/features/calender/view_models/calendar_vm.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatelessWidget {
  final String monthName;

  const CalendarWidget({
    super.key,
    required this.monthName,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Consumer<CalendarVM>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                   monthName,
                    style: styles.inter20w700,
                  ),
                ],
              ),
              12.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 9.h,
                ),
                decoration: BoxDecoration(
                  color: styles.lightCyan,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 14.w,
                    right: 14.w,
                  ),
                  child: Row(
                    children: [
                      ...List.generate(
                        provider.shortWeekDays.length,
                        (index) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                provider.shortWeekDays[index],
                                style: styles.inter12w400,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              WeekDaysWidget(weekNumber: 1),
              WeekDaysWidget(weekNumber: 7),
              WeekDaysWidget(weekNumber: 14),
              WeekDaysWidget(weekNumber: 21),
              WeekDaysWidget(weekNumber: 28),
              WeekDaysWidget(weekNumber: 35),
            ],
          ),
        );
      },
    );
  }
}
