import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/enums/application_status_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/widgets/application_status_widget.dart';

class DescriptionScreen extends StatelessWidget {
  final String description;

  final ApplicationStatus? applicationStatus;
  static const route = "/DescriptionScreen";
  final String? title;

  const DescriptionScreen(
      {Key? key, this.title, this.applicationStatus, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: DividerAppBar(
              title: title ?? AppStrings.subjectTitle,
            ),
          ),
          26.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.description,
                        style: styles.inter14w600.copyWith(
                          color: styles.darkSlateGrey,
                        ),
                      ),
                      if (ApplicationStatus.accepted == applicationStatus)
                        ApplicationStatusWidget(
                          title: AppStrings.accepted,
                          color: styles.paleWhite,
                          iconPath: SvgIcons.tickSquare,
                        )
                      else if (ApplicationStatus.applied == applicationStatus)
                        ApplicationStatusWidget(
                          title: AppStrings.applied,
                          color: styles.lightCyan,
                          iconPath: SvgIcons.applied,
                        )
                      else if (ApplicationStatus.rejected == applicationStatus)
                          ApplicationStatusWidget(
                            title: AppStrings.rejected,
                            color: styles.lightPink,
                            iconPath: SvgIcons.undecided,
                          ),
                    ],
                  ),
                  22.verticalSpace,
                  Text(
                    description,
                    style: styles.inter12w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
