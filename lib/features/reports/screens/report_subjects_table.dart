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
                  10.horizontalSpace,
                  textWidget(con.maxWidth * 0.19, text: "Subject"),
                  textWidget(con.maxWidth * 0.15, text: "Attendance"),
                  textWidget(con.maxWidth * 0.15, text: "Teacher-ID"),
                  textWidget(con.maxWidth * 0.18, text: "Teacher Name"),
                  Expanded(
                    child: Align(
                      child: Text(
                        controller.examType,
                        style: styles.inter7w600.copyWith(
                          color: styles.white,
                        ),
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
                        headingWidget(""),
                        headingWidget(""),
                        headingWidget(""),
                        for (int i = 0; i < 1; i++) ...[
                          headingWidget("%Age"),
                          headingWidget("Grade"),
                          headingWidget("GPA"),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        if (controller.termList.isEmpty)
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "No Record Found",
                style: styles.inter12w600,
              ),
            ),
          ),
        for (int index = 0; index < controller.terms.length; index++)
          LayoutBuilder(
            builder: (context, boxConstraints) {
              final con = boxConstraints;
              return IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.h, top: 1.h),
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
                          child: Text(
                            controller.terms[index].subjectName ?? "-",
                            style: styles.inter12w600,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      1.horizontalSpace,
                      Container(
                        width: con.maxWidth * 0.13,
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: styles.alabaster,
                        ),
                        child: Center(
                            child: Text(
                          "${controller.terms[index].attendance ?? "-"}%",
                          style: styles.inter12w400,
                        )),
                      ),
                      1.horizontalSpace,
                      Container(
                        width: con.maxWidth * 0.10,
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: styles.alabaster,
                        ),
                        child: Center(
                            child: Text(
                              "${controller.terms[index].teacherId ?? "-"}",
                              textAlign: TextAlign.center,
                              style: styles.inter12w400,
                            )),
                      ),
                      1.horizontalSpace,
                      Container(
                        width: con.maxWidth * 0.22,
                        padding: EdgeInsets.symmetric(
                          vertical: 5.h,
                          horizontal: 1.w,
                        ),
                        decoration: BoxDecoration(
                          color: styles.alabaster,
                        ),
                        child: Center(
                            child: Text(
                              "${controller.terms[index].teacherName ?? "-"}",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: styles.inter12w400,
                            )),
                      ),
                      1.horizontalSpace,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            headingWidget(
                                "${(controller.terms[index].subjectPercentage ?? "-")}",
                                getColor(index)),
                            headingWidget(
                                "${controller.terms[index].subjectGrade ?? "-"}",
                                getColor(index)),
                            headingWidget(
                                "${controller.terms[index].gpa ?? "-"}",
                                getColor(index)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        2.verticalSpace,
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
        // decoration: BoxDecoration(color: color ?? styles.alabaster),
        decoration: BoxDecoration(color:styles.alabaster),
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
