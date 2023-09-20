import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/drop_down/dropdown_button2.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/reports/widgets/report_list_tile.dart';
import 'package:hive_mobile/features/reports/widgets/tab_bar_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ReportsScreenVM(),
      child: Consumer<ReportsScreenVM>(
        builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 19.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DividerAppBar(title: AppStrings.reports),
                  17.verticalSpace,
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Image(
                          width: 138.w,
                          height: 54.h,
                          image: AssetImage(SvgIcons.bcpCollegeIcon),
                        ),
                        VerticalDivider(
                          color: styles.black,
                          thickness: 0.5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textColumn("ID", "01234567"),
                                  textColumn("Name", "Abdul Rehman"),
                                  textColumn(
                                      "Academic Year", "Aug,2020 - July,2021"),
                                ],
                              ),
                              29.horizontalSpace,
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textColumn(
                                        "Class", "CAIE A LEVEL - Year 1"),
                                    textColumn("Section", "B-MANEFE-B"),
                                    textColumn("Branch",
                                        "Beaconhouse College Program Defence Campus, Lahore"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Divider(
                    thickness: 0.2,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 9.w,
                        ),
                        decoration: BoxDecoration(
                          color: styles.azure,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            reportHeadingWidget("Subject & Teacher", flex: 2),
                            20.horizontalSpace,
                            reportHeadingWidget("Attendance"),
                            10.horizontalSpace,
                            reportHeadingWidget("Mid Term Assessments",
                                flex: 2),
                            10.horizontalSpace,
                            reportHeadingWidget("Mid Year Exams", flex: 2),
                            20.horizontalSpace,
                            Text(
                              "CGPA",
                              style: styles.inter7w600
                                  .copyWith(color: styles.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  LayoutBuilder(builder: (context, boxConstraints) {
                    final con = boxConstraints;
                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: con.maxWidth * 0.25,
                            padding: EdgeInsets.symmetric(
                              vertical: 29.h,
                            ),
                            decoration: BoxDecoration(
                              color: styles.alabaster,
                            ),
                          ),
                          1.horizontalSpace,
                          Container(
                            width: con.maxWidth * 0.17,
                            padding: EdgeInsets.symmetric(
                              vertical: 29.h,
                            ),
                            decoration: BoxDecoration(
                              color: styles.alabaster,
                            ),
                          ),
                          1.horizontalSpace,
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for (int i = 0; i < 2; i++) ...[
                                  headingWidget("%Age"),
                                  headingWidget("Grade"),
                                  headingWidget("GPA"),
                                ],
                              ],
                            ),
                          ),
                          Container(
                            width: con.maxWidth * 0.09,
                            padding: EdgeInsets.symmetric(
                              vertical: 29.h,
                            ),
                            decoration: BoxDecoration(
                              color: styles.alabaster,
                            ),
                          ),
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded headingWidget(String heading) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          right: 1.w,
        ),
        padding: EdgeInsets.symmetric(vertical: 29.h),
        decoration: BoxDecoration(color: styles.alabaster),
        child: Center(
          child: Text(
            heading,
            style: styles.inter7w600,
          ),
        ),
      ),
    );
  }

  Widget emptyContainer([int flex = 1]) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 29.h,
        ),
        decoration: BoxDecoration(
          color: styles.alabaster,
        ),
      ),
    );
  }

  Widget reportHeadingWidget(String heading, {int flex = 1}) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Text(
      heading,
      style: styles.inter7w600.copyWith(
        color: styles.white,
      ),
    );
  }

  Widget textColumn(String heading, String description) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 3.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: styles.inter8w600,
          ),
          Text(
            description,
            style: styles.inter8w400,
          ),
        ],
      ),
    );
  }
}
