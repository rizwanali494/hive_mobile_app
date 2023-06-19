import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/calender/view_models/calendar_vm.dart';
import 'package:provider/provider.dart';

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

    return Consumer<CalendarVM>(
      builder: (context, provider, child) {
        if (day == null || !isValidDay) {
          return SizedBox();
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25.h,
          ),
          child: provider.isValidDay(day ?? 0 + 25, 2, 2024)
              ? Text(
                  "${day}",
                  style: styles.inter12w400,
                )
              : SizedBox(),
        );
      },
    );
  }
}
