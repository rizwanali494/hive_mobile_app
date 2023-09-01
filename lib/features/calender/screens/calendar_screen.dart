import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/calender/controllers/clean_calendar_controller.dart';
import 'package:hive_mobile/features/calender/screens/scrollable_clean_calendar.dart';
import 'package:hive_mobile/features/calender/utils/enums.dart';
import 'package:hive_mobile/features/calender/view_models/calendar_vm.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
  static const route = "/Calendar";

  const CalendarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final controller = CleanCalendarController(
        minDate: DateTime(2023), maxDate: DateTime(2030), readOnly: true);
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => CalendarVM(),
      child: Consumer<CalendarVM>(
        builder: (context, provider, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 19.w,
                ),
                child: AppBarWidget(
                  color: styles.black,
                  title: AppStrings.calendar,
                ),
              ),
              // Expanded(
              //   child: ListView.separated(
              //     padding: EdgeInsets.symmetric(
              //       vertical: 20.h,
              //     ),
              //     itemBuilder: (context, index) {
              //       return ChangeNotifierProvider(
              //         create: (BuildContext context) =>
              //             WeekDayVM(month: index + 1, year: 2024),
              //         child: CalendarWidget(
              //           monthName: provider.monthNames[index],
              //         ),
              //       );
              //     },
              //     separatorBuilder: (context, index) => 39.verticalSpace,
              //     itemCount: provider.monthNames.length,
              //   ),
              // ),\
              10.verticalSpace,
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 150.w,
                  margin: EdgeInsets.only(
                    right: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                    border: Border.all(
                      color: styles.black.withOpacity(
                        0.2,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 19.w,
                    vertical: 10.h,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: DropdownButton<int>(
                      value: provider.selectedValue,
                      isExpanded: true,
                      isDense: true,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      dropdownColor: styles.white,
                      underline: const SizedBox(),
                      items: provider.years
                          .map(
                            (item) => DropdownMenuItem<int>(
                              value: item,
                              child: Text(
                                item.toString(),
                                style: styles.inter12w400,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        provider.setYear(value);
                      },
                    ),
                  ),
                ),
              ),
              // DropdownButton(
              //   items: provider.years
              //       .map(
              //         (item) => DropdownMenuItem<String>(
              //           value: item,
              //           child: Text(
              //             item,
              //             style: styles.inter12w400,
              //           ),
              //         ),
              //       )
              //       .toList(),
              //   onChanged: (item) {},
              // ),
              10.verticalSpace,

              Expanded(
                child: ScrollableCleanCalendar(
                  calendarController: controller,
                  scrollController: scrollController,
                  layout: Layout.BEAUTY,
                  calendarCrossAxisSpacing: 0,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
