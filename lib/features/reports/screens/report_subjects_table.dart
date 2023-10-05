import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/view_models/report_table_vm.dart';

class ReportSubjectsTable extends StatefulWidget {
  final ReportTableVM reportTableVM;

  const ReportSubjectsTable({super.key, required this.reportTableVM});

  @override
  State<ReportSubjectsTable> createState() => _ReportSubjectsTableState();
}

class _ReportSubjectsTableState extends State<ReportSubjectsTable> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final controller = widget.reportTableVM;

    return Column(
      children: [
        LayoutBuilder(
          builder: (context, con) {
            return Container(
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
                children: [
                  textWidget(con.maxWidth * 0.25, text: "Subject & Teacher"),
                  textWidget(con.maxWidth * 0.16, text: "Attendance"),
                  Expanded(
                    child: Align(
                      child: Text(
                        "Mid Year Assessment",
                        style: styles.inter7w600.copyWith(
                          color: styles.white,
                        ),
                      ),
                    ),
                    // textWidget(con.maxWidth*0.10,text: "Mid Term Accessment"),
                    // textWidget(con.maxWidth*0.10,text: "Mid Year Exam"),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Mid Year Exam",
                        style: styles.inter7w600.copyWith(
                          color: styles.white,
                        ),
                      ),
                    ),
                    // textWidget(con.maxWidth*0.10,text: "Mid Term Accessment"),
                    // textWidget(con.maxWidth*0.10,text: "Mid Year Exam"),
                  ),
                  Center(
                    child: Text(
                      "CGPA",
                      style: styles.inter7w600.copyWith(
                        color: styles.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        LayoutBuilder(
          builder: (context, boxConstraints) {
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
                      vertical: 25.h,
                    ),
                    decoration: BoxDecoration(
                      color: styles.alabaster,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        for (int index = 0; index < controller.termDetails.length; index++)
          LayoutBuilder(
            builder: (context, boxConstraints) {
              final con = boxConstraints;
              return IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: con.maxWidth * 0.25,
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: styles.alabaster,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.termDetails[index].assessment2
                                        ?.teacherName ??
                                    "",
                                style: styles.inter12w600,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                controller.termDetails[index].assessment2
                                        ?.subjectName ??
                                    "",
                                style: styles.inter12w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      1.horizontalSpace,
                      Container(
                        width: con.maxWidth * 0.17,
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: styles.alabaster,
                        ),
                        child: Center(
                            child: Text(
                          "90%",
                          style: styles.inter12w400,
                        )),
                      ),
                      1.horizontalSpace,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            headingWidget(
                                "${controller.termDetails[index].assessment1?.percentage}",
                                getColor(index)),
                            headingWidget(
                                "${controller.termDetails[index].assessment1?.grade}",
                                getColor(index)),
                            headingWidget(
                                "${controller.termDetails[index].assessment1?.gpa}",
                                getColor(index)),
                            headingWidget(
                                "${(controller.termDetails[index].assessment2?.percentage ?? "-")}",
                                getColor(index)),
                            headingWidget(
                                "${controller.termDetails[index].assessment2?.grade ?? "-"}",
                                getColor(index)),
                            headingWidget(
                                "${controller.termDetails[index].assessment2?.gpa ?? "-"}",
                                getColor(index)),
                          ],
                        ),
                      ),
                      Container(
                        width: con.maxWidth * 0.09,
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: styles.alabaster,
                        ),
                        child: Center(
                          child: Text(
                            controller.termDetails[index].cgpa
                                .toStringAsPrecision(3),
                            style: styles.inter12w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        2.verticalSpace,
        LayoutBuilder(
          builder: (context, size) {
            return IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: size.maxWidth * 0.085,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(color: styles.alabaster),
                    child: Center(
                      child: Text(
                        controller.assessment1AvgGPA,
                        style: styles.inter12w600,
                      ),
                    ),
                  ),
                  1.horizontalSpace,
                  Container(
                    width: size.maxWidth * 0.075,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(color: styles.alabaster),
                  ),
                  1.horizontalSpace,
                  Container(
                    width: size.maxWidth * 0.075,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(color: styles.alabaster),
                  ),
                  1.horizontalSpace,
                  Container(
                    width: size.maxWidth * 0.085,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(color: styles.alabaster),
                    child: Center(
                      child: Text(
                        controller.assessment2AvgGPA,
                        style: styles.inter12w600,
                      ),
                    ),
                  ),
                  1.horizontalSpace,
                  Container(
                    width: size.maxWidth * 0.085,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(color: styles.alabaster),
                    child: Center(
                      child: Text(
                        controller.assessmentsAvgCGPA,
                        style: styles.inter12w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        14.verticalSpace,
        Row(
          children: [
            summaryWidget(
              "Summary",
              color: styles.alabaster,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(59.r),
              ),
            ),
            1.horizontalSpace,
            summaryWidget("Mean GPA :2.4", color: styles.paleSkyBlue, flex: 2),
            1.horizontalSpace,
            summaryWidget("Top GPA :5", color: styles.paleWhite),
            1.horizontalSpace,
            summaryWidget(
              "Bottom GPA :-1.9",
              color: styles.peachYellow,
              flex: 2,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(59.r),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget summaryWidget(String value,
      {Color? color, int flex = 1, BorderRadiusGeometry? borderRadius}) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        padding: EdgeInsets.only(
          left: 9.w,
          bottom: 7.h,
          top: 7.h,
        ),
        child: Text(
          value,
          style: styles.inter10w600,
        ),
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
