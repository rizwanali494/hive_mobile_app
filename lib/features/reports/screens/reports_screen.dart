import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/reports/screens/report_header_widget.dart';
import 'package:hive_mobile/features/reports/screens/report_term_screen.dart';
import 'package:hive_mobile/features/reports/widgets/year_toggle_widget.dart';
import 'package:hive_mobile/features/reports/view_models/report_widget_vm.dart';
import 'package:hive_mobile/features/reports/view_models/report_year1_vm.dart';
import 'package:hive_mobile/features/reports/view_models/report_year2_vm.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/reports/view_models/term_details_vm.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  late List<ChartData> data;
  late List<ChartData> data2;

  @override
  void initState() {
    data = [
      ChartData('CHN', 5.5),
      ChartData('GER', 2.5),
      ChartData('BRZ', 3),
    ];
    data2 = [
      ChartData('CHN', -1.5),
      ChartData('RUS', -2),
    ];
    super.initState();
  }

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
            child: Column(
              children: [
                AppBarWidget(
                    color: styles.black,
                    horizontalPadding: 0,
                    title: AppStrings.reports,
                    titleStyle: styles.inter28w700),
                15.verticalSpace,
                ReportHeaderWidget(styles: styles),
                Divider(
                  thickness: 0.2,
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          provider.selectYear(0);
                        },
                        child: YearToggleWidget(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50.r),
                          ),
                          isSelected: provider.selectedYear == 0,
                          text: 'Year 1',
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          provider.selectYear(1);
                        },
                        child: YearToggleWidget(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(50.r),
                          ),
                          isSelected: provider.selectedYear == 1,
                          text: 'Year 2',
                        ),
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                Expanded(
                  child: MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        key: Key("1"),
                        create: (context) => ReportYear1VM(),
                      ),
                      ChangeNotifierProvider(
                        key: Key("2"),
                        create: (context) => ReportYear2VM(),
                      ),
                    ],
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: provider.pageController,
                      children: [
                        Consumer<ReportYear1VM>(
                          builder: (context, provider, child) {
                            if (provider.isLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ReportTermScreen(
                              provider: TermDetailsVM(
                                  selectedTerm: provider.selectedTerm,
                                  assessmentSummary: provider.summaryByTerm,
                                  selectTerm: provider.setSelectedTerm,
                                  assessments: provider.termAssessments,
                                  reportIdModel: provider.reportIdModel,
                                  onRefresh: provider.onRefresh),
                            );
                          },
                        ),
                        Consumer<ReportYear2VM>(
                          builder: (context, provider, child) {
                            if (provider.isLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ReportTermScreen(
                              provider: TermDetailsVM(
                                  selectedTerm: provider.selectedTerm,
                                  assessmentSummary: provider.summaryByTerm,
                                  selectTerm: provider.setSelectedTerm,
                                  onRefresh: provider.onRefresh,
                                  assessments: provider.termAssessments,
                                  reportIdModel: provider.reportIdModel),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: Column(
                //       children: [
                //         ReportHeaderWidget(styles: styles),
                //         10.verticalSpace,
                //         Divider(
                //           thickness: 0.2,
                //         ),
                //         10.verticalSpace,
                //         Row(
                //           children: [
                //             Expanded(
                //               child: GestureDetector(
                //                 onTap: () {
                //                   provider.selectYear(0);
                //                 },
                //                 child: YearToggleWidget(
                //                   borderRadius: BorderRadius.horizontal(
                //                     left: Radius.circular(50.r),
                //                   ),
                //                   isSelected: provider.selectedYear == 0,
                //                   text: 'Year 1',
                //                 ),
                //               ),
                //             ),
                //             Expanded(
                //               child: GestureDetector(
                //                 onTap: () {
                //                   provider.selectYear(1);
                //                 },
                //                 child: YearToggleWidget(
                //                   borderRadius: BorderRadius.horizontal(
                //                     right: Radius.circular(50.r),
                //                   ),
                //                   isSelected: provider.selectedYear == 1,
                //                   text: 'Year 2',
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         15.verticalSpace,
                //         Row(
                //           children: [
                //             Expanded(
                //               child: GestureDetector(
                //                 onTap: () {
                //                   provider.selectTerm(0);
                //                 },
                //                 child: TermToggleWidget(
                //                   isSelected: provider.selectedTerm == 0,
                //                   text: 'Term 1',
                //                 ),
                //               ),
                //             ),
                //             14.horizontalSpace,
                //             Expanded(
                //               child: GestureDetector(
                //                 onTap: () {
                //                   provider.selectTerm(1);
                //                 },
                //                 child: TermToggleWidget(
                //                   isSelected: provider.selectedTerm == 1,
                //                   text: 'Term 2',
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         16.verticalSpace,
                //         ReportSubjectsTable(),
                //         30.verticalSpace,
                //         Divider(
                //           thickness: 0.5,
                //           color: styles.black.withOpacity(0.5),
                //         ),
                //         33.verticalSpace,
                //         ReportLineChart(),
                //         30.verticalSpace,
                //         Row(
                //           children: [
                //             Padding(
                //               padding: EdgeInsets.only(
                //                 left: 5.w,
                //               ),
                //               child: Text(
                //                 "CGPA",
                //                 style: styles.inter8w400,
                //               ),
                //             ),
                //             Expanded(
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   YearRowWidget(
                //                       context: context,
                //                       color: styles.skyBlue,
                //                       text: "Year 1"),
                //                   52.horizontalSpace,
                //                   YearRowWidget(
                //                       context: context,
                //                       color: styles.darkOrange,
                //                       text: "Year 2"),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //         30.verticalSpace,
                //         Divider(
                //           thickness: 0.5,
                //           color: styles.black.withOpacity(0.5),
                //         ),
                //         33.verticalSpace,
                //         ReportTermWidget(
                //             context: context,
                //             data: data,
                //             data2: data2,
                //             styles: styles,
                //             examsCount: 2,
                //             term: 2),
                //         ReportTermWidget(
                //             context: context,
                //             data: data,
                //             data2: data2,
                //             styles: styles,
                //             examsCount: 2,
                //             term: 2),
                //         10.verticalSpace,
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             barLegendWidget("Accounting", styles.denimBlue),
                //             barLegendWidget("Mathematics", styles.gravel),
                //             barLegendWidget("Economics", styles.yellowGreen),
                //             barLegendWidget("Business", styles.paleOrange),
                //           ],
                //         ),
                //         10.verticalSpace,
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          );
        },
      ),
    );
  }

  Padding barLegendWidget(String text, Color color) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Row(
        children: [
          Container(
            width: 6.w,
            height: 6.h,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          3.horizontalSpace,
          Text(
            text,
            style: styles.inter10w600,
          )
        ],
      ),
    );
  }

  Color getColor(int index) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    if (index == 0) {
      return styles.peachYellow;
    }
    if (index == 1) {
      return styles.lightGreen;
    }
    return styles.paleSkyBlue;
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
