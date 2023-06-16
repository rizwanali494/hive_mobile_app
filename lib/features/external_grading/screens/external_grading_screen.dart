import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/screens/adding_external_grade_screen.dart';
import 'package:hive_mobile/features/external_grading/widgets/grade_info_widget.dart';
import 'package:hive_mobile/features/external_grading/widgets/grading_title_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/screens/blue_action_button.dart';

class ExternalGradingScreen extends StatelessWidget {
  static const route = "/ExternalGrading";

  const ExternalGradingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      backgroundColor: styles.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
        ),
        child: Column(
          children: [
            DividerAppBar(
              title: AppStrings.externalGrading,
              titleStyle: styles.inter32w700,
              showDivider: false,
            ),
            36.verticalSpace,
            BlueActionButton(
              title: AppStrings.addExternalGrade,
              onTap: () {
                context.push(AddExternalGradeScreen.route);
              },
            ),
            20.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: styles.lightCyan,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 21.w),
                child: Row(
                  children: [
                    GradingTitleWidget(
                      title: AppStrings.degree,
                    ),
                    GradingTitleWidget(
                      title: AppStrings.institute,
                      flex: 2,
                    ),
                    GradingTitleWidget(
                      title: AppStrings.subjects,
                    ),
                    GradingTitleWidget(
                      title: AppStrings.grade,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            5.verticalSpace,
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                itemBuilder: (context, index) {
                  return GradeInfoWidget();
                },
                separatorBuilder: (context, index) {
                  return 10.verticalSpace;
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
