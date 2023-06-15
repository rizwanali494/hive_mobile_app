import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/features/university_application/widgets/application_info_widget.dart';

import 'package:hive_mobile/app/enums/application_status_enum.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

class UniversityApplicationWidget extends StatelessWidget {
  final String tile;
  final ApplicationStatus applicationStatus;

  const UniversityApplicationWidget({
    super.key,
    required this.tile,
    required this.applicationStatus,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tile,
          style: styles.inter20w700,
        ),
        25.verticalSpace,
        ApplicationInfoWidget(
          applicationStatus: applicationStatus,
        ),
        ApplicationInfoWidget(
          applicationStatus: applicationStatus,
        ),
        ApplicationInfoWidget(
          applicationStatus: applicationStatus,
        ),
        const ApplicationInfoWidget(
          applicationStatus: null,
        ),
      ],
    );
  }
}
