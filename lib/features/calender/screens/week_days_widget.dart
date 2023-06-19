import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/calender/screens/day_widget.dart';
import 'package:hive_mobile/features/calender/view_models/calendar_vm.dart';
import 'package:provider/provider.dart';

class WeekDaysWidget extends StatelessWidget {
  final int weekNumber;

  const WeekDaysWidget({
    super.key,
    required this.weekNumber,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Consumer<CalendarVM>(
      builder: (context, provider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: IntrinsicHeight(
            child: Row(
              children: [
                ...List.generate(
                  7,
                  (index) => Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: horizontalBorderSide(styles, index),
                          left: horizontalBorderSide(styles, index),
                          bottom: otherBorderSide(styles, index),
                          top: BorderSide.none,
                        ),
                      ),
                      child: Center(
                        child: DayWidget(
                          // day: index + 1,
                          day: index + weekNumber,
                          isValidDay: provider.isValidDay(
                            // index + 1,
                            index + weekNumber,
                            2,
                            2024,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BorderSide horizontalBorderSide(AppTheme styles, int index) {
    if (index == 0 || index == 6) {
      return BorderSide.none;
    }
    return BorderSide(
      color: styles.black.withOpacity(.5),
      width: .2,
    );
  }

  BorderSide otherBorderSide(AppTheme styles, int index) {
    return BorderSide(
      color: styles.black.withOpacity(.5),
      width: .2,
    );
  }
}
