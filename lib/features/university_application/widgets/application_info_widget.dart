import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/enums/application_status_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/features/university_application/widgets/application_status_widget.dart';

import '../../../app/resources/app_theme.dart';

class ApplicationInfoWidget extends StatelessWidget {
  final ApplicationStatus? applicationStatus;

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
            else
            ApplicationStatusWidget(
              title: AppStrings.rejected,
              color: styles.lightPink,
              iconPath: SvgIcons.undecided,
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
