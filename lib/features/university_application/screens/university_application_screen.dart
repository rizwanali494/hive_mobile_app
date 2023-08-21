import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/university_selection_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/university_application_screen_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/blue_action_button.dart';
import 'package:hive_mobile/features/university_application/widgets/university_app_shimmer_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/university_app_sliver_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/university_application_widget.dart';
import 'package:provider/provider.dart';

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

    return ChangeNotifierProvider(
      create: (BuildContext context) => UniversityApplicationScreenVM(),
      child: Scaffold(
        body: Consumer<UniversityApplicationScreenVM>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(
                  color: styles.black,
                  horizontalPadding: 19.w,
                  titleStyle: styles.inter20w700,
                  title: AppStrings.universityApplication,
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
                        3.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 26.h,
                            ),
                            child: RefreshIndicator(
                              onRefresh: provider.refresh,
                              backgroundColor: styles.white,
                              child: CustomScrollView(
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: Text(
                                      applications[0],
                                      style: styles.inter20w700,
                                    ),
                                  ),
                                  SliverToBoxAdapter(child: 20.verticalSpace),
                                  UniversityAppSliver(
                                    applications: provider.acceptedApplications,
                                    isLoading: provider.isAcceptedLoading,
                                  ),
                                  SliverToBoxAdapter(child: 20.verticalSpace),
                                  SliverToBoxAdapter(
                                    child: Text(
                                      applications[1],
                                      style: styles.inter20w700,
                                    ),
                                  ),
                                  SliverToBoxAdapter(child: 20.verticalSpace),
                                  UniversityAppSliver(
                                    applications: provider.previousApplications,
                                    isLoading: provider.isPreviousLoading,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  final applications = [
    "Accepted Applications",
    "Previous Applications",
    "Previous Applications",
  ];
}
