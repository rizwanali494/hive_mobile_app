import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/reports/screens/bar_chart_legend_widget.dart';
import 'package:hive_mobile/features/reports/screens/report_bar_chart.dart';
import 'package:hive_mobile/features/reports/screens/report_header_widget.dart';
import 'package:hive_mobile/features/reports/screens/report_line_chart.dart';
import 'package:hive_mobile/features/reports/screens/report_term_screen.dart';
import 'package:hive_mobile/features/reports/screens/year_row_widget.dart';
import 'package:hive_mobile/features/reports/view_models/bar_chat_vm.dart';
import 'package:hive_mobile/features/reports/view_models/line_chat_vm.dart';
import 'package:hive_mobile/features/reports/view_models/report_year_vm.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          key: Key("1"),
          create: (context) => ReportYear1VM(),
        ),
        ChangeNotifierProvider(
          key: Key("2"),
          create: (context) => ReportYear2VM(),
        ),
        ChangeNotifierProvider(
          key: Key("2"),
          create: (context) => ReportsScreenVM(),
        ),
        ChangeNotifierProvider(
          key: Key("2"),
          create: (context) => ReportYearVM(),
        ),
      ],
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
                          provider.selectYear(1);
                        },
                        child: YearToggleWidget(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50.r),
                          ),
                          isSelected: provider.selectedYear == 1,
                          text: 'Year 1',
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          provider.selectYear(2);
                        },
                        child: YearToggleWidget(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(50.r),
                          ),
                          isSelected: provider.selectedYear == 2,
                          text: 'Year 2',
                        ),
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                // if (provider.selectedYear < 0)
                //   Consumer<ReportYearVM>(
                //     builder: (context, provider, child) {
                //       return Expanded(
                //         child: SingleChildScrollView(
                //           child: Column(
                //             children: [
                //               21.verticalSpace,
                //               ReportLineChart(
                //                 controller: LineChartVM(
                //                     lineBarsDataTerm1:
                //                         provider.lineBarsDataTerm1,
                //                     lineBarsDataTerm2:
                //                         provider.lineBarsDataTerm2),
                //               ),
                //               33.verticalSpace,
                //               Row(
                //                 children: [
                //                   Padding(
                //                     padding: EdgeInsets.only(
                //                       left: 5.w,
                //                     ),
                //                     child: Text(
                //                       "CGPA",
                //                       style: styles.inter8w400,
                //                     ),
                //                   ),
                //                   Expanded(
                //                     child: Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceAround,
                //                       children: [
                //                         YearRowWidget(
                //                             context: context,
                //                             color: styles.skyBlue,
                //                             text: "${provider.examType1}"),
                //                         YearRowWidget(
                //                             context: context,
                //                             color: styles.darkOrange,
                //                             text: "${provider.examType2}"),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               20.verticalSpace,
                //               Divider(
                //                 thickness: 0.5,
                //                 color: styles.black.withOpacity(0.5),
                //               ),
                //               32.verticalSpace,
                //               ReportBarChart(
                //                 controller: BarChartVM(
                //                   assessments1: provider.midTermReports,
                //                   assessments2: provider.midYearReports,
                //                   context: context,
                //                   showTermDetails: true,
                //                   examType1: "Mid Term Assessment",
                //                   examType2: "Mid Year Exam",
                //                 ),
                //                 term: 1,
                //               ),
                //               10.verticalSpace,
                //               ReportBarChart(
                //                 controller: BarChartVM(
                //                   assessments1: provider.mockTermReports,
                //                   assessments2: provider.mockExamReports,
                //                   context: context,
                //                   showTermDetails: true,
                //                   examType1: "Mock Term Assessment",
                //                   examType2: "Mock Exam",
                //                 ),
                //                 term: 2,
                //               ),
                //               10.verticalSpace,
                //               Align(
                //                 alignment: Alignment.topRight,
                //                 child: Wrap(
                //                   runSpacing: 10,
                //                   spacing: 10,
                //                   children: [
                //                     for (int index = 0;
                //                         index < provider.subjectNames.length;
                //                         index++)
                //                       BarChartLegendWidget(
                //                           text: provider.subjectNames[index],
                //                           color: colors[index] ??
                //                               Colors.blueAccent),
                //                   ],
                //                 ),
                //               ),
                //               10.verticalSpace,
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   )
                // else
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: provider.pageController,
                    children: [
                      Consumer<ReportYearVM>(
                        builder: (context, provider, child) {
                          if (provider.isLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return RefreshIndicator(
                            onRefresh: provider.onRefresh,
                            backgroundColor: styles.skyBlue,
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  21.verticalSpace,
                                  ReportLineChart(
                                    controller: LineChartVM(
                                        lineBarsDataTerm1:
                                            provider.lineBarsDataTerm1,
                                        lineBarsDataTerm2:
                                            provider.lineBarsDataTerm2),
                                  ),
                                  33.verticalSpace,
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 5.w,
                                        ),
                                        child: Text(
                                          "CGPA",
                                          style: styles.inter8w400,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            YearRowWidget(
                                                context: context,
                                                color: styles.skyBlue,
                                                text: "${provider.examType1}"),
                                            YearRowWidget(
                                                context: context,
                                                color: styles.darkOrange,
                                                text: "${provider.examType2}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  20.verticalSpace,
                                  Divider(
                                    thickness: 0.5,
                                    color: styles.black.withOpacity(0.5),
                                  ),
                                  32.verticalSpace,
                                  ReportBarChart(
                                    controller: BarChartVM(
                                      assessments1: provider.midTermReports,
                                      assessments2: provider.midYearReports,
                                      context: context,
                                      showTermDetails: true,
                                      examType1: "Mid Term Assessment",
                                      examType2: "Mid Year Exam",
                                    ),
                                    term: 1,
                                  ),
                                  10.verticalSpace,
                                  ReportBarChart(
                                    controller: BarChartVM(
                                      assessments1: provider.mockTermReports,
                                      assessments2: provider.mockExamReports,
                                      context: context,
                                      showTermDetails: true,
                                      examType1: "Mock Term Assessment",
                                      examType2: "Mock Exam",
                                    ),
                                    term: 2,
                                  ),
                                  10.verticalSpace,
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Wrap(
                                      runSpacing: 10,
                                      spacing: 10,
                                      children: [
                                        for (int index = 0;
                                            index <
                                                provider.subjectNames.length;
                                            index++)
                                          BarChartLegendWidget(
                                              text:
                                                  provider.subjectNames[index],
                                              color: colors[index] ??
                                                  Colors.blueAccent),
                                      ],
                                    ),
                                  ),
                                  10.verticalSpace,
                                ],
                              ),
                            ),
                          );
                        },
                      ),
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
                  )
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

  late final styles = Theme.of(context).extension<AppTheme>()!;

  late Map<int, Color> colors = {
    0: styles.denimBlue,
    1: styles.gravel,
    2: styles.darkOrange,
    3: styles.paleOrange,
  };
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
