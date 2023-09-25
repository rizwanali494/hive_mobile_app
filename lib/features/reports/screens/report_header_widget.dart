import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/screens/report_text_column.dart';

class ReportHeaderWidget extends StatelessWidget {
  const ReportHeaderWidget({
    super.key,
    required this.styles,
  });

  final AppTheme styles;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
                        description: "Aug,2020 - July,2021"),
                  ],
                ),
                29.horizontalSpace,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReportTextColumn(
                          context: context,
                          heading: "Class",
                          description: "CAIE A LEVEL - Year 1"),
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
    );
  }
}
