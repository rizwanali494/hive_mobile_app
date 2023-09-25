import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/report_line_chart.dart';
import 'package:hive_mobile/features/reports/screens/report_text_column.dart';
import 'package:hive_mobile/features/reports/screens/year_row_widget.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  late List<_ChartData> data;
  late List<_ChartData> data2;

  @override
  void initState() {
    // TODO: implement initState
    data = [
      _ChartData('CHN', 5.5),
      _ChartData('GER', 2.5),
      _ChartData('BRZ', 3),
    ];
    data2 = [
      _ChartData('CHN', -1.5),
      _ChartData('RUS', -2),
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
                DividerAppBar(title: AppStrings.reports),
                17.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReportTextColumn(
                                            context: context,
                                            heading: "ID",
                                            description: "01234567"),
                                        ReportTextColumn(
                                            context: context,
                                            heading: "Name",
                                            description: "Abdul Rehman"),
                                        ReportTextColumn(
                                            context: context,
                                            heading: "Academic Year",
                                            description:
                                                "Aug,2020 - July,2021"),
                                      ],
                                    ),
                                    29.horizontalSpace,
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ReportTextColumn(
                                              context: context,
                                              heading: "Class",
                                              description:
                                                  "CAIE A LEVEL - Year 1"),
                                          ReportTextColumn(
                                              context: context,
                                              heading: "Section",
                                              description: "B-MANEFE-B"),
                                          ReportTextColumn(
                                              context: context,
                                              heading: "Branch",
                                              description:
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
                        10.verticalSpace,
                        const ReportLineChart(),
                        30.verticalSpace,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  YearRowWidget(
                                      context: context,
                                      color: styles.skyBlue,
                                      text: "Year 1"),
                                  52.horizontalSpace,
                                  YearRowWidget(
                                      context: context,
                                      color: styles.darkOrange,
                                      text: "Year 2"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        25.verticalSpace,
                        // values
                        termWidget(styles, 2, 1),
                        termWidget(styles, 2, 2),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget termWidget(AppTheme styles, [int examsCount = 1, int term = 1]) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                termDividerWidget(styles),
                RotatedBox(
                  quarterTurns: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    child: Text(
                      "Term $term",
                      style: styles.inter8w400,
                    ),
                  ),
                ),
                termDividerWidget(styles),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  ...List.generate(
                    examsCount,
                    (index) => barChartWidget(terms[index % terms.length]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget barChartWidget(String heading) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              heading,
              style: styles.inter12w500,
              textAlign: TextAlign.center,
            ),
          ),
          11.horizontalSpace,
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 150.h,
              // width: 150.h,
              child: SfCartesianChart(
                borderWidth: 0.2,
                borderColor: Colors.black,
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  isVisible: false,
                ),
                primaryYAxis: NumericAxis(
                  minimum: -2,
                  labelStyle: styles.inter8w400,
                  majorTickLines: MajorTickLines(size: 0),
                  plotOffset: 0,
                  // maximumLabelWidth: 0,
                  borderColor: Colors.amber,
                  majorGridLines: MajorGridLines(
                      dashArray: [1, 2], width: 1, color: styles.black),
                  maximum: 6,
                  interval: 2,
                ),
                series: <ChartSeries<_ChartData, String>>[
                  BarSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(12),
                    ),
                  ),
                  BarSeries<_ChartData, String>(
                    dataSource: data2,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget termDividerWidget(AppTheme styles) {
    return Expanded(
      child: VerticalDivider(
        color: styles.black.withOpacity(0.5),
        width: 0.5.w,
        thickness: 0.5.w,
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

final subjectText = [
  "Accounting",
  "Mathematics",
  "Economics",
  "Business",
];
final teachers = [
  "Ahmad Ali",
  "Abrar Khan",
  "MS. Ayesha",
  "Akhtar",
];
final terms = [
  "Mid Term\nAssessment",
  "Mid Year\nExams",
];

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
