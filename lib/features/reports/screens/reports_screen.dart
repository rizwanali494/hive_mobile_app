import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/report_header_widget.dart';
import 'package:hive_mobile/features/reports/screens/report_line_chart.dart';
import 'package:hive_mobile/features/reports/screens/report_term_widget.dart';
import 'package:hive_mobile/features/reports/screens/year_row_widget.dart';
import 'package:hive_mobile/features/reports/screens/year_toggle_widget.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
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
    // TODO: implement initState
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
                DividerAppBar(title: AppStrings.reports),
                17.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ReportHeaderWidget(styles: styles),
                        10.verticalSpace,
                        Divider(
                          thickness: 0.2,
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            YearToggleWidget(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50.r),
                              ),
                              isSelected: true,
                              text: 'Year 1',
                            ),
                            YearToggleWidget(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(50.r),
                              ),
                              isSelected: false,
                              text: 'Year 2',
                            ),
                          ],
                        ),
                        21.verticalSpace,
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
                        ReportTermWidget(
                            context: context,
                            data: data,
                            data2: data2,
                            styles: styles,
                            examsCount: 2,
                            term: 1),
                        ReportTermWidget(
                            context: context,
                            data: data,
                            data2: data2,
                            styles: styles,
                            examsCount: 2,
                            term: 2),
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

// final subjectText = [
//   "Accounting",
//   "Mathematics",
//   "Economics",
//   "Business",
// ];
// final teachers = [
//   "Ahmad Ali",
//   "Abrar Khan",
//   "MS. Ayesha",
//   "Akhtar",
// ];

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
