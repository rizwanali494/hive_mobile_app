import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/features/home/screens/app_bar_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/university_application_widget.dart';

import '../../../app/enums/application_status_enum.dart';
import '../../../app/resources/app_theme.dart';

class UniversityApplicationScreen extends StatefulWidget {
  static const route = "/UniversityApplication";

  const UniversityApplicationScreen({Key? key}) : super(key: key);

  @override
  State<UniversityApplicationScreen> createState() =>
      _UniversityApplicationScreenState();
}

class _UniversityApplicationScreenState
    extends State<UniversityApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarWidget(
            onMenuTap: () {
              context.pop();
            },
            color: styles.black,
            icon: const Icon(Icons.arrow_back_ios),
            titleStyle: styles.inter28w700,
            title: AppStrings.universityApplication,
          ),
          30.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                        color: styles.skyBlue,
                        borderRadius: BorderRadius.circular(28)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.addApplication,
                            style: styles.inter16w400.copyWith(
                              color: styles.white,
                            ),
                          ),
                          SvgPicture.asset(SvgIcons.addSquare),
                        ],
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return UniversityApplicationWidget(
                          tile: applications[index],
                          applicationStatus: index.isEven
                              ? ApplicationStatus.accepted
                              : ApplicationStatus.applied,
                        );
                      },
                      itemCount: applications.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final applications = [
    "Accepted Applications",
    "Previous Applications",
    "Previous Applications",
  ];
}
