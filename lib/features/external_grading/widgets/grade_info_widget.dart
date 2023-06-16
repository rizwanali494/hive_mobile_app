import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/widgets/grading_title_widget.dart';

class GradeInfoWidget extends StatelessWidget {
  const GradeInfoWidget({
    super.key,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: SvgPicture.asset(SvgIcons.eye),
              )
              // Expanded(
              //   child: Padding(
              //     padding: EdgeInsets.only(
              //       right: 10
              //     ),
              //     child: SvgPicture.asset(SvgIcons.eye),
              //   ),
              // ),
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
