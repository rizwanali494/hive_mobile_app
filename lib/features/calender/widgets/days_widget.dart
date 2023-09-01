import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/activities/screens/activity_details_screen.dart';
import 'package:hive_mobile/features/calender/controllers/clean_calendar_controller.dart';
import 'package:hive_mobile/features/calender/models/day_values_model.dart';
import 'package:hive_mobile/features/calender/utils/enums.dart';
import 'package:hive_mobile/features/calender/utils/extensions.dart';

class DaysWidget extends StatelessWidget {
  final CleanCalendarController cleanCalendarController;
  final DateTime month;
  final double calendarCrossAxisSpacing;
  final double calendarMainAxisSpacing;
  final Layout? layout;
  final Widget Function(
    BuildContext context,
    DayValues values,
  )? dayBuilder;
  final Color? selectedBackgroundColor;
  final Color? backgroundColor;
  final Color? selectedBackgroundColorBetween;
  final Color? disableBackgroundColor;
  final Color? dayDisableColor;
  final double radius;
  final TextStyle? textStyle;

  const DaysWidget({
    Key? key,
    required this.month,
    required this.cleanCalendarController,
    required this.calendarCrossAxisSpacing,
    required this.calendarMainAxisSpacing,
    required this.layout,
    required this.dayBuilder,
    required this.selectedBackgroundColor,
    required this.backgroundColor,
    required this.selectedBackgroundColorBetween,
    required this.disableBackgroundColor,
    required this.dayDisableColor,
    required this.radius,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Start weekday - Days per week - The first weekday of this month
    // 7 - 7 - 1 = -1 = 1
    // 6 - 7 - 1 = -2 = 2

    // What it means? The first weekday does not change, but the start weekday have changed,
    // so in the layout we need to change where the calendar first day is going to start.
    int monthPositionStartDay = (cleanCalendarController.weekdayStart -
            DateTime.daysPerWeek -
            DateTime(month.year, month.month).weekday)
        .abs();
    monthPositionStartDay = monthPositionStartDay > DateTime.daysPerWeek
        ? monthPositionStartDay - DateTime.daysPerWeek
        : monthPositionStartDay;

    final start = monthPositionStartDay == 7 ? 0 : monthPositionStartDay;

    // If the monthPositionStartDay is equal to 7, then in this layout logic will cause a trouble, beacause it will
    // have a line in blank and in this case 7 is the same as 0.

    return GridView.count(
      crossAxisCount: DateTime.daysPerWeek,
      physics: const NeverScrollableScrollPhysics(),
      addRepaintBoundaries: false,
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
      ),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      shrinkWrap: true,
      childAspectRatio: 0.7,
      children: List.generate(
          DateTime(month.year, month.month + 1, 0).day + start, (index) {
        if (index < start)
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
        final day = DateTime(month.year, month.month, (index + 1 - start));
        final text = (index + 1 - start).toString();

        bool isSelected = false;

        if (cleanCalendarController.rangeMinDate != null) {
          if (cleanCalendarController.rangeMinDate != null &&
              cleanCalendarController.rangeMaxDate != null) {
            isSelected = day
                    .isSameDayOrAfter(cleanCalendarController.rangeMinDate!) &&
                day.isSameDayOrBefore(cleanCalendarController.rangeMaxDate!);
          } else {
            isSelected =
                day.isAtSameMomentAs(cleanCalendarController.rangeMinDate!);
          }
        }

        Widget widget;

        final dayValues = DayValues(
          day: day,
          isFirstDayOfWeek: day.weekday == cleanCalendarController.weekdayStart,
          isLastDayOfWeek: day.weekday == cleanCalendarController.weekdayEnd,
          isSelected: isSelected,
          maxDate: cleanCalendarController.maxDate,
          minDate: cleanCalendarController.minDate,
          text: text,
          selectedMaxDate: cleanCalendarController.rangeMaxDate,
          selectedMinDate: cleanCalendarController.rangeMinDate,
        );

        if (dayBuilder != null) {
          widget = dayBuilder!(context, dayValues);
        } else {
          widget = <Layout, Widget Function()>{
            Layout.DEFAULT: () => _pattern(context, dayValues),
            Layout.BEAUTY: () => _beauty(context, dayValues),
          }[layout]!();
        }

        return GestureDetector(
          onTap: () {
            if (day.isBefore(cleanCalendarController.minDate) &&
                !day.isSameDay(cleanCalendarController.minDate)) {
              if (cleanCalendarController.onPreviousMinDateTapped != null) {
                cleanCalendarController.onPreviousMinDateTapped!(day);
              }
            } else if (day.isAfter(cleanCalendarController.maxDate)) {
              if (cleanCalendarController.onAfterMaxDateTapped != null) {
                cleanCalendarController.onAfterMaxDateTapped!(day);
              }
            } else {
              if (!cleanCalendarController.readOnly) {
                cleanCalendarController.onDayClick(day);
              }
            }
          },
          child: widget,
        );
      }),
    );
  }

  BorderSide buildBorderSide() => BorderSide(
        width: 0.5,
        color: Colors.black,
      );

  Widget _pattern(BuildContext context, DayValues values) {
    Color bgColor = backgroundColor ?? Theme.of(context).colorScheme.surface;
    TextStyle txtStyle =
        (textStyle ?? Theme.of(context).textTheme.bodyLarge)!.copyWith(
      color: backgroundColor != null
          ? backgroundColor!.computeLuminance() > .5
              ? Colors.black
              : Colors.white
          : Theme.of(context).colorScheme.onSurface,
    );

    if (values.isSelected) {
      if ((values.selectedMinDate != null &&
              values.day.isSameDay(values.selectedMinDate!)) ||
          (values.selectedMaxDate != null &&
              values.day.isSameDay(values.selectedMaxDate!))) {
        bgColor =
            selectedBackgroundColor ?? Theme.of(context).colorScheme.primary;
        txtStyle =
            (textStyle ?? Theme.of(context).textTheme.bodyLarge)!.copyWith(
          color: selectedBackgroundColor != null
              ? selectedBackgroundColor!.computeLuminance() > .5
                  ? Colors.black
                  : Colors.white
              : Theme.of(context).colorScheme.onPrimary,
        );
      } else {
        bgColor = selectedBackgroundColorBetween ??
            Theme.of(context).colorScheme.primary.withOpacity(.3);
        txtStyle =
            (textStyle ?? Theme.of(context).textTheme.bodyLarge)!.copyWith(
          color: selectedBackgroundColor != null &&
                  selectedBackgroundColor == selectedBackgroundColorBetween
              ? selectedBackgroundColor!.computeLuminance() > .5
                  ? Colors.black
                  : Colors.white
              : selectedBackgroundColor ??
                  Theme.of(context).colorScheme.primary,
        );
      }
    } else if (values.day.isSameDay(values.minDate)) {
      bgColor = Colors.transparent;
      txtStyle = (textStyle ?? Theme.of(context).textTheme.bodyLarge)!.copyWith(
        color: selectedBackgroundColor ?? Theme.of(context).colorScheme.primary,
      );
    } else if (values.day.isBefore(values.minDate) ||
        values.day.isAfter(values.maxDate)) {
      bgColor = disableBackgroundColor ??
          Theme.of(context).colorScheme.surface.withOpacity(.4);
      txtStyle = (textStyle ?? Theme.of(context).textTheme.bodyLarge)!.copyWith(
        color: dayDisableColor ??
            Theme.of(context).colorScheme.onSurface.withOpacity(.5),
        decoration: TextDecoration.lineThrough,
      );
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        border: values.day.isSameDay(values.minDate)
            ? Border.all(
                color: selectedBackgroundColor ??
                    Theme.of(context).colorScheme.primary,
                width: 2,
              )
            : null,
      ),
      child: Text(
        values.text,
        textAlign: TextAlign.center,
        style: txtStyle,
      ),
    );
  }

  Widget _beauty(BuildContext context, DayValues values) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    BorderRadiusGeometry? borderRadius;
    Color bgColor = Colors.transparent;
    Border? border;
    bool isEven = (int.tryParse(values.text))?.toInt().isEven ?? false;
    if (values.isFirstDayOfWeek) {
      border = Border(
        // left: values.text!="1"?buildBorderSide():BorderSide.none,
        bottom: buildBorderSide(),
        right: buildBorderSide(),
      );
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
          border: Border(
            // left: values.text!="1"?buildBorderSide():BorderSide.none,
            bottom: buildBorderSide(),
            right: buildBorderSide(),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              values.text,
              textAlign: TextAlign.center,
              style: styles.inter12w400,
            ),
            // Text(
            //   "Music Concert",
            //   textAlign: TextAlign.center,
            //   style: styles.inter10w400,
            // ),
          ],
        ),
      );
    }
    if (values.isLastDayOfWeek) {
      border = Border(
        // left: values.text!="1"?buildBorderSide():BorderSide.none,
        bottom: buildBorderSide(),
        // right: buildBorderSide(),
      );

      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius,
            border: Border(
              // left: values.text!="1"?buildBorderSide():BorderSide.none,
              bottom: buildBorderSide(),
              // right: buildBorderSide(),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              values.text,
              textAlign: TextAlign.center,
              style: styles.inter12w400,
            ),
            // Text(
            //   "Music Concert",
            //   textAlign: TextAlign.center,
            //   style: styles.inter10w400,
            // ),
          ],
        ),
      );
    }
    border = Border(
      // left: values.text!="1"?buildBorderSide():BorderSide.none,
      bottom: buildBorderSide(),
      right: buildBorderSide(),
    );

    return GestureDetector(
      onTap: () {
        context.push(ActivityDetailScreen.route);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isEven ? Color(0xffA2C73B) : null,
          borderRadius: borderRadius,
          border: border,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              values.text,
              textAlign: TextAlign.center,
              style: styles.inter12w400.copyWith(
                color: isEven ? styles.white : null,
              ),
            ),
            if (isEven)
              Text(
                "Music Concert",
                textAlign: TextAlign.center,
                style: styles.inter10w400.copyWith(
                  color: isEven ? styles.white : null,
                ),
              ),
          ],
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     context.push(ActivityDetailScreen.route);
    //   },
    //   child: Container(
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //         color: isEven ? Color(0xffA2C73B) : null,
    //         borderRadius: borderRadius,
    //         border: Border(
    //           // left: values.text!="1"?buildBorderSide():BorderSide.none,
    //           bottom: buildBorderSide(),
    //           right: buildBorderSide(),
    //         )),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           values.text,
    //           textAlign: TextAlign.center,
    //           style: styles.inter12w400.copyWith(
    //             color: isEven ? styles.white : null,
    //           ),
    //         ),
    //         Text(
    //           "Music Concert",
    //           textAlign: TextAlign.center,
    //           style: styles.inter10w400.copyWith(
    //             color: isEven ? styles.white : null,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
