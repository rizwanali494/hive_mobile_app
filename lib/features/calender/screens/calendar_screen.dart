import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/calender/view_models/calendar_vm.dart';
import 'package:provider/provider.dart';

import 'package:hive_mobile/features/calender/screens/day_builder_new.dart';

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
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => CalendarVM(),
      child: Consumer<CalendarVM>(
        builder: (context, provider, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AppBarWidget(
                color: styles.black,
                title: AppStrings.calendar,
              ),
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
              10.verticalSpace,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      for (int i = 0;
                          i < provider.calendarController.months.length;
                          i++) ...[
                        SliverToBoxAdapter(
                          child: Text(
                            DateTime(provider.calendarController.months[i].year,
                                    provider.calendarController.months[i].month)
                                .monthOnly,
                            style: styles.inter20w700,
                          ),
                        ),
                        SliverToBoxAdapter(child: 8.verticalSpace),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                                color: styles.lightCyan,
                                borderRadius: BorderRadius.circular(25.r)),
                            child: Row(
                              children: [
                                ...List.generate(
                                  provider.shortWeekDays.length,
                                  (index) => Expanded(
                                    child: Center(
                                      child: Text(
                                        "${provider.shortWeekDays[index]}",
                                        style: styles.inter12w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DayBuilderNew(
                          month: provider.calendarController.months[i],
                          cleanCalendarController: provider.calendarController,
                        ),
                        SliverToBoxAdapter(child: 40.verticalSpace),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  BorderSide buildBorderSide() => BorderSide(
        width: 0.5,
        color: Colors.black,
      );
}
