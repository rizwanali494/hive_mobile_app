import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';
import 'package:hive_mobile/app/view_models/default_status_controller.dart';
import 'package:hive_mobile/features/university_application/widgets/application_status_widget.dart';

class ApplicationInfoWidget extends StatelessWidget {
  final ApplicationState? applicationStatus;

  const ApplicationInfoWidget({
    super.key,
    required this.applicationStatus,
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
              controller: DefaultStatusController(),
            )
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
