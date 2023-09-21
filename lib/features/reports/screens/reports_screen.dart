import 'package:fl_chart/fl_chart.dart';
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
                                  textColumn("Class", "CAIE A LEVEL - Year 1"),
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
                Expanded(
                  child: LineChart(
                    LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            color: styles.skyBlue,
                            barWidth: 8,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                            spots: const [
                              FlSpot(0, 0),
                              FlSpot(0.5, 1.5),
                              FlSpot(1, 2),
                              FlSpot(1.5, 1),
                              FlSpot(1.9, 2),
                              FlSpot(2.4, 3),
                              FlSpot(2.9, 2),
                              FlSpot(3.2, 4),
                            ],
                          ),
                          LineChartBarData(
                            isCurved: true,
                            color: styles.darkOrange,
                            barWidth: 8,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                            spots: const [
                              FlSpot(0, 0),
                              FlSpot(0.7, 0.5),
                              FlSpot(1, 0.7),
                              FlSpot(1.5, 0.7),
                              FlSpot(1.8, 0.7),
                              FlSpot(2, 0.9),
                              FlSpot(2.2, 0.9),
                              FlSpot(3.5, 0.9),
                              FlSpot(4, 2),
                              FlSpot(4, 4),
                            ],
                          ),
                        ],
                        minX: 0,
                        maxX: 8,
                        maxY: 6,
                        minY: -2,
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              getTitlesWidget: leftTitleWidgets,
                              showTitles: true,
                              interval: 2,
                              reservedSize: 40,
                            ),
                          ),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        )),
                    swapAnimationDuration: Duration(milliseconds: 150),
                    // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  ),
                ),
                // LayoutBuilder(
                //   builder: (context, con) {
                //     return Container(
                //       padding: EdgeInsets.symmetric(
                //         vertical: 10.h,
                //         horizontal: 9.w,
                //       ),
                //       decoration: BoxDecoration(
                //         color: styles.azure,
                //         borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(10.r),
                //           topRight: Radius.circular(10.r),
                //         ),
                //       ),
                //       child: Row(
                //         children: [
                //           textWidget(con.maxWidth * 0.25,
                //               text: "Subject & Teacher"),
                //           textWidget(con.maxWidth * 0.16, text: "Attendance"),
                //           Expanded(
                //             child: Align(
                //               child: Text(
                //                 "Mid Year Assessment",
                //                 style: styles.inter7w600.copyWith(
                //                   color: styles.white,
                //                 ),
                //               ),
                //             ),
                //             // textWidget(con.maxWidth*0.10,text: "Mid Term Accessment"),
                //             // textWidget(con.maxWidth*0.10,text: "Mid Year Exam"),
                //           ),
                //           Expanded(
                //             child: Center(
                //               child: Text(
                //                 "Mid Year Exam",
                //                 style: styles.inter7w600.copyWith(
                //                   color: styles.white,
                //                 ),
                //               ),
                //             ),
                //             // textWidget(con.maxWidth*0.10,text: "Mid Term Accessment"),
                //             // textWidget(con.maxWidth*0.10,text: "Mid Year Exam"),
                //           ),
                //           Center(
                //             child: Text(
                //               "CGPA",
                //               style: styles.inter7w600.copyWith(
                //                 color: styles.white,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                // LayoutBuilder(
                //   builder: (context, boxConstraints) {
                //     final con = boxConstraints;
                //     return IntrinsicHeight(
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //             width: con.maxWidth * 0.25,
                //             padding: EdgeInsets.symmetric(
                //               vertical: 29.h,
                //             ),
                //             decoration: BoxDecoration(
                //               color: styles.alabaster,
                //             ),
                //           ),
                //           1.horizontalSpace,
                //           Container(
                //             width: con.maxWidth * 0.17,
                //             padding: EdgeInsets.symmetric(
                //               vertical: 29.h,
                //             ),
                //             decoration: BoxDecoration(
                //               color: styles.alabaster,
                //             ),
                //           ),
                //           1.horizontalSpace,
                //           Expanded(
                //             child: Row(
                //               mainAxisAlignment:
                //                   MainAxisAlignment.spaceAround,
                //               children: [
                //                 for (int i = 0; i < 2; i++) ...[
                //                   headingWidget("%Age"),
                //                   headingWidget("Grade"),
                //                   headingWidget("GPA"),
                //                 ],
                //               ],
                //             ),
                //           ),
                //           Container(
                //             width: con.maxWidth * 0.09,
                //             padding: EdgeInsets.symmetric(
                //               vertical: 25.h,
                //             ),
                //             decoration: BoxDecoration(
                //               color: styles.alabaster,
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                // 1.verticalSpace,
                // // values
                // for (int index = 0; index < subjectText.length; index++)
                //   LayoutBuilder(
                //     builder: (context, boxConstraints) {
                //       final con = boxConstraints;
                //       return IntrinsicHeight(
                //         child: Padding(
                //           padding: EdgeInsets.only(bottom: 1.h),
                //           child: Row(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 width: con.maxWidth * 0.25,
                //                 padding: EdgeInsets.symmetric(
                //                   vertical: 5.h,
                //                 ),
                //                 decoration: BoxDecoration(
                //                   color: styles.alabaster,
                //                 ),
                //                 child: Center(
                //                   child: Column(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.center,
                //                     children: [
                //                       Text(
                //                         subjectText[index],
                //                         style: styles.inter12w600,
                //                         overflow: TextOverflow.ellipsis,
                //                       ),
                //                       Text(
                //                         teachers[index],
                //                         style: styles.inter12w400,
                //                         overflow: TextOverflow.ellipsis,
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //               1.horizontalSpace,
                //               Container(
                //                 width: con.maxWidth * 0.17,
                //                 padding: EdgeInsets.symmetric(
                //                   vertical: 5.h,
                //                 ),
                //                 decoration: BoxDecoration(
                //                   color: styles.alabaster,
                //                 ),
                //                 child: Center(
                //                     child: Text(
                //                   "90%",
                //                   style: styles.inter12w400,
                //                 )),
                //               ),
                //               1.horizontalSpace,
                //               Expanded(
                //                 child: Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceAround,
                //                   children: [
                //                     for (int i = 0; i < 2; i++) ...[
                //                       headingWidget("89", getColor(index)),
                //                       headingWidget("A+", getColor(index)),
                //                       headingWidget("5", getColor(index)),
                //                     ],
                //                   ],
                //                 ),
                //               ),
                //               Container(
                //                 width: con.maxWidth * 0.09,
                //                 padding: EdgeInsets.symmetric(
                //                   vertical: 5.h,
                //                 ),
                //                 decoration: BoxDecoration(
                //                   color: styles.alabaster,
                //                 ),
                //                 child: Center(
                //                   child: Text(
                //                     "5.0",
                //                     style: styles.inter12w400,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget textWidget(double width, {required String text}) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Container(
      width: width,
      child: Text(
        text,
        style: styles.inter7w600.copyWith(color: styles.white),
      ),
    );
  }

  Widget headingWidget(String heading, [Color? color]) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          right: 1.w,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(color: color ?? styles.alabaster),
        child: Center(
          child: Text(
            heading,
            style: styles.inter7w600,
          ),
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

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = value.toInt().toString();

    return Text(text, style: style, textAlign: TextAlign.center);
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
