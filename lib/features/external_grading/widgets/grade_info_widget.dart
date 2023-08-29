import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/screens/grade_details_screen.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_info_vm.dart';
import 'package:hive_mobile/features/external_grading/widgets/grading_title_widget.dart';

class GradeInfoWidget extends StatelessWidget {
  final GradeInfoVM controller;

  const GradeInfoWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: Row(
            children: [
              GradingTitleWidget(
                title: controller.degree,
              ),
              GradingTitleWidget(
                title: controller.institute,
                // flex: 2,
              ),
              GradingTitleWidget(
                title: controller.subject,
              ),
              GradingTitleWidget(
                title: controller.grade,
              ),
              SizedBox(
                width: 35.w,
                height: 20.h,
                child: GestureDetector(
                  onTap: () {
                    context.push(GradeDetailsScreen.route);
                  },
                  child: SvgPicture.asset(SvgIcons.eye),
                ),
              ),
              // GestureDetector(
              //     onTap: () {
              //       context.push(GradeDetailsScreen.route);
              //     }, child: Expanded(child: SvgPicture.asset(SvgIcons.eye)))
            ],
          ),
        ),
        10.verticalSpace,
        Divider(
          color: styles.black.withOpacity(.2),
        )
      ],
    );
  }
}
