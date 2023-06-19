import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:provider/provider.dart';

import '../view_models/week_day_vm.dart';

class DayWidget extends StatelessWidget {
  final int? day;
  final bool isValidDay;

  const DayWidget({
    super.key,
    this.day,
    required this.isValidDay,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Consumer<WeekDayVM>(
      builder: (context, provider, child) {
        if (day == null || !isValidDay) {
          return SizedBox();
        }
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25.h,
          ),
          child: provider.isValidDay(day ?? 0 + 25)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${day}",
                      style: styles.inter12w400,
                    ),
                    if (day?.isEven ?? false)
                      Padding(
                        padding: EdgeInsets.symmetric(),
                        child: Text(
                          "Music Concert",
                          textAlign: TextAlign.center,
                          style: styles.inter10w400.copyWith(fontSize: 7.w),
                        ),
                      ),
                  ],
                )
              : SizedBox(),
        );
      },
    );
  }
}
