import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/calender/screens/calendar_widget.dart';
import 'package:hive_mobile/features/calender/view_models/calendar_vm.dart';
import 'package:hive_mobile/features/home/screens/app_bar_widget.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
import 'package:provider/provider.dart';

import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/features/calender/view_models/week_day_vm.dart';

class CalendarScreen extends StatelessWidget {
  static const route = "/Calendar";

  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeScreenVm(),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => CalendarVM(),
        child: Consumer<CalendarVM>(
          builder: (context, provider, child) {
            return Scaffold(
              body: Column(
                children: [
                  AppBarWidget(color: styles.black, title: AppStrings.calendar),
                  Expanded(

                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                      ),
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider(
                          create: (BuildContext context) =>
                              WeekDayVM(month: index + 1, year: 2024),
                          child: CalendarWidget(
                            monthName: provider.monthNames[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => 39.verticalSpace,
                      itemCount: provider.monthNames.length,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
