import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/calender/controllers/clean_calendar_controller.dart';
import 'package:hive_mobile/features/calender/models/day_values_model.dart';
import 'package:hive_mobile/features/calender/screens/days_event_screen.dart';
import 'package:hive_mobile/features/calender/view_models/calendar_vm.dart';
import 'package:provider/provider.dart';

class DayBuilderNew extends StatelessWidget {
  final DateTime month;
  final CleanCalendarController cleanCalendarController;

  const DayBuilderNew({super.key, required this.month, required this.cleanCalendarController});

  @override
  Widget build(BuildContext context) {
    int monthPositionStartDay = (cleanCalendarController.weekdayStart -
        DateTime.daysPerWeek -
        DateTime(month.year, month.month).weekday)
        .abs();
    monthPositionStartDay = monthPositionStartDay > DateTime.daysPerWeek
        ? monthPositionStartDay - DateTime.daysPerWeek
        : monthPositionStartDay;
    final styles = Theme.of(context).extension<AppTheme>()!;
    final start = (monthPositionStartDay == 7 ? 0 : monthPositionStartDay);
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          final day = DateTime(month.year, month.month, (index + 1 - start));
          final text = (index + 1 - start).toString();
          if (index < start) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                bottom: buildBorderSide(),
                right: buildBorderSide(),
                // top: BorderSide(width: 0.5,color: Colors.black,),
              )),
              child: SizedBox.shrink(),
            );
          }
          final values = DayValues(
            day: day,
            isFirstDayOfWeek:
                day.weekday == cleanCalendarController.weekdayStart,
            isLastDayOfWeek: day.weekday == cleanCalendarController.weekdayEnd,
            isSelected: false,
            maxDate: cleanCalendarController.maxDate,
            minDate: cleanCalendarController.minDate,
            text: text,
            selectedMaxDate: cleanCalendarController.rangeMaxDate,
            selectedMinDate: cleanCalendarController.rangeMinDate,
          );

          BorderRadiusGeometry? borderRadius;
          BoxDecoration? boxDecoration;
          Color bgColor = Colors.transparent;
          Border? border;
          final calendarProvider = context.read<CalendarVM>();
          var event = calendarProvider.getEvent(values.day);
          bool hasEvent = event != null;
          if (values.isFirstDayOfWeek) {
            boxDecoration = BoxDecoration(
              border: Border(
                bottom: buildBorderSide(),
                right: buildBorderSide(),
              ),
              color: hasEvent ? Color(0xffA2C73B) : null,
            );
          }
          if (values.isLastDayOfWeek) {
            boxDecoration = BoxDecoration(
              color: hasEvent ? Color(0xffA2C73B) : null,
              borderRadius: borderRadius,
              border: Border(
                bottom: buildBorderSide(),
                // right: buildBorderSide(),
              ),
            );
          } else {
            boxDecoration = BoxDecoration(
              color: hasEvent ? Color(0xffA2C73B) : null,
              borderRadius: borderRadius,
              border: Border(
                bottom: buildBorderSide(),
                right: buildBorderSide(),
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              log("message : ${event.toString()}");
              if (hasEvent) {
                log("${day.toString()}");
                context.push(DaysEventScreen.route, extra: {"date": day});
              }
            },
            child: Container(
              alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   color: hasEvent ? Color(0xffA2C73B) : null,
              //   borderRadius: borderRadius,
              //   border: border,
              // ),
              decoration: boxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    values.text,
                    textAlign: TextAlign.center,
                    style: styles.inter12w400.copyWith(
                      color: hasEvent ? styles.white : null,
                    ),
                  ),
                  if (hasEvent)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        event.name ?? "",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: styles.inter10w400.copyWith(
                          color: hasEvent ? styles.white : null,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
        childCount: DateTime(month.year, month.month + 1, 0).day + start,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: DateTime.daysPerWeek,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.7,
      ),
    );
  }

  BorderSide buildBorderSide() => BorderSide(
    width: 0.2,
        color: Colors.black,
      );
}
