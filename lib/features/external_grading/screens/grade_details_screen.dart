import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/screens/gradeInfoWidget.dart';
import 'package:hive_mobile/features/external_grading/screens/grade_detail_widget.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_info_vm.dart';
import 'package:hive_mobile/features/external_grading/widgets/grade_info_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';

class GradeDetailsScreen extends StatelessWidget {
  final GradeInfoVM controller;
  static const route = "/GradeDetails";

  const GradeDetailsScreen({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
        ),
        child: Column(
          children: [
            DividerAppBar(
              title: AppStrings.viewDetails,
              titleStyle: styles.inter20w700,
            ),
            26.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradeDetailWidget(
                      title: AppStrings.degree,
                    ),
                    GradeDetailWidget(
                      title: AppStrings.institute,
                    ),
                    GradeDetailWidget(
                      title: AppStrings.subjects,
                    ),
                    GradeDetailWidget(
                      title: AppStrings.grade,
                    ),
                    GradeDetailWidget(
                      title: AppStrings.document,
                    ),
                  ],
                ),
                40.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradeInfoDescription(description: controller.degree),
                    GradeInfoDescription(description: controller.institute),
                    GradeInfoDescription(description: controller.subject),
                    GradeInfoDescription(description: controller.grade),
                    Row(
                      children: [
                        GradeInfoDescription(
                          description: controller.documentName,
                        ),
                        12.horizontalSpace,
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: styles.yellowGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_downward_sharp,
                            size: 20,
                            color: styles.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            21.verticalSpace,
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: ApplicationStatusWidget(
            //     color: styles.lightPink,
            //     title: AppStrings.delete,
            //     iconPath: SvgIcons.undecided,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
