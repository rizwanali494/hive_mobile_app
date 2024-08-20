import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/view_models/report_text_column.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:provider/provider.dart';

class ReportHeaderWidget extends StatelessWidget {
  const ReportHeaderWidget({
    super.key,
    required this.styles,
  });

  final AppTheme styles;

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportsScreenVM>(
      builder: (context, provider, child) {
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
                            heading: AppStrings.id.toUpperCase(),
                            description:
                                "${provider.userModel.accountData?.extra?.studentId ?? ""}"),
                        ReportTextColumn(
                            context: context,
                            heading: AppStrings.name,
                            description:
                                "${provider.userModel.accountData?.extra?.studentName}"),
                        ReportTextColumn(
                            context: context,
                            heading: AppStrings.academicYear,
                            description: "${provider.userModel.accountData?.extra?.academicYearTitle}"),
                      ],
                    ),
                    29.horizontalSpace,
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReportTextColumn(
                              context: context,
                              heading: AppStrings.Class,
                              description:
                                  "${provider.userModel.accountData?.extra?.className ?? ""}"),
                          ReportTextColumn(
                              context: context,
                              heading: AppStrings.section,
                              description:
                                  "${provider.userModel.accountData?.extra?.sectionName ?? ""}"),
                          ReportTextColumn(
                              context: context,
                              heading: AppStrings.branch,
                              description:
                                  "${provider.userModel.accountData?.extra?.branchName ?? ""}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
