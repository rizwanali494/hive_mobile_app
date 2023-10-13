import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/university_application/screens/university_app_request_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/accepted_application_vm.dart';
import 'package:hive_mobile/features/university_application/view_models/previous_application_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/blue_action_button.dart';
import 'package:hive_mobile/features/university_application/widgets/university_app_sliver_widget.dart';
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

    return Scaffold(
      body: Column(
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
                  Builder(builder: (context) {
                    return BlueActionButton(
                      title: AppStrings.addApplication,
                      onTap: () async {
                        var model =
                            await context.push(UniversitySelectionScreen.route);
                        log(model.runtimeType.toString());
                        context
                            .read<PreviousApplicationVM>()
                            .addUniversityApp(model);
                      },
                    );
                  }),
                  3.verticalSpace,
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Builder(builder: (context) {
                        return RefreshIndicator(
                          onRefresh: () async {
                            try {
                              await Future.wait([
                                context.read<AcceptedApplicationVM>().refresh(),
                                context.read<PreviousApplicationVM>().refresh(),
                              ]);
                            } catch (e) {
                              log("error ${e.toString()}");
                            }
                            return;
                          },
                          backgroundColor: styles.white,
                          child: CustomScrollView(
                            slivers: [
                              Consumer<AcceptedApplicationVM>(
                                builder: (context, provider, child) {
                                  return UniversityAppSliver(
                                    controller: provider.sliverVM,
                                  );
                                },
                              ),
                              Consumer<PreviousApplicationVM>(
                                builder: (context, provider, child) {
                                  return UniversityAppSliver(
                                    controller: provider.sliverVM,
                                  );
                                },
                              ),
                              // SliverToBoxAdapter(
                              //   child: Text(
                              //     applications[0],
                              //     style: styles.inter20w700,
                              //   ),
                              // ),
                              // SliverToBoxAdapter(child: 20.verticalSpace),
                              // UniversityAppSliver(
                              //   applications: provider.acceptedApplications,
                              //   isLoading: provider.isAcceptedLoading,
                              // ),
                              // if (!provider.isAcceptedLoading)
                              //   ShowMoreButton(
                              //     styles: styles,
                              //     hasAll: provider.hasAllAccepted,
                              //     onTap: (){
                              //       provider.getNextAcceptedApplications();
                              //     },
                              //     isLoading: provider.isGettingMoreAccepted,
                              //   ),
                              // SliverToBoxAdapter(child: 20.verticalSpace),
                              // SliverToBoxAdapter(
                              //   child: Text(
                              //     applications[1],
                              //     style: styles.inter20w700,
                              //   ),
                              // ),
                              // SliverToBoxAdapter(child: 20.verticalSpace),
                              // UniversityAppSliver(
                              //   applications: provider.previousApplications,
                              //   isLoading: provider.isPreviousLoading,
                              // ),
                              // if (!provider.isPreviousLoading)
                              //   ShowMoreButton(
                              //     styles: styles,
                              //     onTap: () {
                              //       provider.getNextPreviousApplications();
                              //     },
                              //     hasAll: provider.hasAllPrevious,
                              //     isLoading: provider.isGettingMorePrevious,
                              //   ),
                            ],
                          ),
                        );
                      }),
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
