import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/enums/application_status_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/home/screens/app_bar_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/university_selection_screen.dart';
import 'package:hive_mobile/features/university_application/screens/blue_action_button.dart';
import 'package:hive_mobile/features/university_application/widgets/university_application_widget.dart';

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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 19.w,
            ),
            child: AppBarWidget(
              color: styles.black,
              titleStyle: styles.inter20w700,
              title: AppStrings.universityApplication,
            ),
          ),
          25.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlueActionButton(
                    title: AppStrings.addApplication,
                    onTap: () {
                      context.push(UniversitySelectionScreen.route);
                    },
                  ),
                  5.verticalSpace,
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return UniversityApplicationWidget(
                          title: applications[index],
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
