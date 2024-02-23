import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/reports/screens/report_header_widget.dart';
import 'package:hive_mobile/features/reports/screens/report_term_screen.dart';
import 'package:hive_mobile/features/reports/view_models/reports_data_controller.dart';
import 'package:hive_mobile/features/reports/widgets/term_toggle_widget.dart';
import 'package:hive_mobile/features/reports/widgets/year_toggle_widget.dart';
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


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Consumer<ReportDataController>(
      builder: (context, reportDataController, child) {

        return MultiProvider(
          providers: [
            ChangeNotifierProxyProvider<ReportDataController, ReportYear1VM>(
              create: (context) => ReportYear1VM(),
              update: (BuildContext context, value, ReportYear1VM? previous) {
                return previous!..updateReport(value.reports);
              },
            ),
            ChangeNotifierProxyProvider<ReportDataController, ReportYear2VM>(
              create: (context) => ReportYear2VM(),
              update: (BuildContext context, value, ReportYear2VM? previous) {
                return previous!..updateReport(value.reports);
              },
            ),
            ChangeNotifierProvider(
              create: (context) => ReportsScreenVM(),
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
                      titleStyle: styles.inter28w700,
                      actions: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              SvgPicture.asset(SvgIcons.verifiedIcon),
                              7.horizontalSpace,
                              Text(
                                "Password\nProtected",
                                style: styles.inter10w400,
                              ),
                              9.horizontalSpace,
                              VerticalDivider(
                                thickness: 0.5,
                              ),
                              9.horizontalSpace,
                              GestureDetector(
                                  onTap: () {
                                    provider.generateReportToken(context);
                                    // context.push(ReportWebView.route);
                                    // launchUrl(
                                    //   Uri.parse(
                                    //           "https://hive.bcp.net.pk/view-reports-pdf")
                                    //       .replace(
                                    //     queryParameters: {
                                    //       "token":
                                    //           "gAAAAABlOLgTYVoODpWzuIPaqitum77Z450jHK1JwzZy9ODMFXsmXdOPZ_PWIX6U4TzgZEku_JD70YScY6FyzU3C3Nyd2oSIdQ=="
                                    //     },
                                    //   ),
                                    //   mode: LaunchMode.inAppWebView,
                                    // );
                                  },
                                  child: SvgPicture.asset(
                                      SvgIcons.downloadIcon)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    ReportHeaderWidget(styles: styles),
                    Divider(
                      thickness: 0.2,
                    ),
                    10.verticalSpace,
                    if( reportDataController.isLoading )
                      Expanded(child: Center(child: CircularProgressIndicator(),))
                    else...[
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
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: provider.pageController,
                          children: [
                            Consumer<ReportYear1VM>(
                              builder: (context, provider, child) {
                                // if (provider.isLoading) {
                                //   return Center(
                                //     child: CircularProgressIndicator(),
                                //   );
                                // }
                                return ReportTermScreen(
                                  provider: TermDetailsVM(
                                    selectedTerm: provider.selectedTerm,
                                    selectedExam: provider.selectedExam,
                                    selectedExamType: provider.selectedExamType,
                                    selectExam: provider.setExamType,
                                    assessmentSummary: provider.summaryByTerm,
                                    selectTerm: provider.setSelectedTerm,
                                    assessments: provider.termAssessments,
                                    reportIdModel: provider.reportIdModel,
                                    onRefresh: reportDataController.onRefresh,
                                    termDetails: provider.getCurrentExamList,
                                  ),
                                );
                              },
                            ),
                            Consumer<ReportYear2VM>(
                              builder: (context, provider, child) {
                                // if (provider.isLoading) {
                                //   return Center(
                                //     child: CircularProgressIndicator(),
                                //   );
                                // }

                                return ReportTermScreen(
                                  provider: TermDetailsVM(
                                    selectedTerm: provider.selectedTerm,
                                    assessmentSummary: provider.summaryByTerm,
                                    selectedExam: provider.selectedExam,
                                    selectExam: provider.setExamType,
                                    selectTerm: provider.setSelectedTerm,
                                    onRefresh: reportDataController.onRefresh,
                                    assessments: provider.termAssessments,
                                    reportIdModel: provider.reportIdModel,
                                    selectedExamType: provider.selectedExamType,
                                    termDetails: provider.getCurrentExamList,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],

                  ],
                ),
              );
            },
          ),
        );
      },
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

