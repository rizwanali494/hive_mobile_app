import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/university_app_widget_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/application_info_widget.dart';

import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

import 'application_status_widget.dart';

class UniversityApplicationWidget extends StatelessWidget {
  final String title;
  final ApplicationState applicationStatus;
  final UniversityAppWidgetVM controller;

  const UniversityApplicationWidget({
    super.key,
    required this.title,
    required this.applicationStatus,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.universityName,
                      style: styles.inter14w600.copyWith(
                        color: styles.darkSlateGrey,
                      ),
                    ),
                    Text(
                      AppStrings.loremPorum * 2,
                      style: styles.inter10w400.copyWith(
                        color: styles.darkGrey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    context.push(DescriptionScreen.route,
                        extra: applicationStatus ?? ApplicationState.rejected);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.comment,
                        style: styles.inter14w600.copyWith(
                          color: styles.darkSlateGrey,
                        ),
                      ),
                      SvgPicture.asset(SvgIcons.eye)
                    ],
                  ),
                ),
              ),
            ),
            ApplicationStatusWidget(
              applicationStatus: applicationStatus,
            ),
          ],
        ),
        5.verticalSpace,
        Divider(
          color: styles.black.withOpacity(0.2),
        ),
        18.verticalSpace,
      ],
    );
  }
}
