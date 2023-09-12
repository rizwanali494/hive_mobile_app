import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/external_grading/screens/adding_external_grade_screen.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_vm.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_info_vm.dart';
import 'package:hive_mobile/features/external_grading/widgets/external_grade_shimmer.dart';
import 'package:hive_mobile/features/external_grading/widgets/grade_info_widget.dart';
import 'package:hive_mobile/features/external_grading/widgets/grading_title_widget.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/blue_action_button.dart';
import 'package:provider/provider.dart';

class ExternalGradingScreen extends StatelessWidget {
  static const route = "/ExternalGrading";

  const ExternalGradingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      backgroundColor: styles.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
        ),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => ExternalGradeVM(),
          child: Consumer<ExternalGradeVM>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  AppBarWidget(
                      color: styles.black,
                      horizontalPadding: 0,
                      title: AppStrings.externalGrading,
                      titleStyle: styles.inter28w700),
                  27.verticalSpace,
                  BlueActionButton(
                    title: AppStrings.addExternalGrade,
                    onTap: () {
                      context.push(AddExternalGradeScreen.route);
                    },
                  ),
                  20.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 9.h,
                    ),
                    decoration: BoxDecoration(
                      color: styles.lightCyan,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 21.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: GradingTitleWidget(
                              title: AppStrings.degree,
                            ),
                          ),
                          // GradingTitleWidget(
                          //   title: AppStrings.institute,
                          //   // flex: 2,
                          // ),
                          // GradingTitleWidget(
                          //   title: AppStrings.subjects,
                          // ),
                          // GradingTitleWidget(
                          //   title: AppStrings.grade,
                          // ),
                          // SizedBox(
                          //   width: 35.w,
                          //   height: 13.h,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  if (provider.isLoading)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 19.w,
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                            vertical: 27.h,
                          ),
                          separatorBuilder: (context, index) {
                            return 20.verticalSpace;
                          },
                          itemBuilder: (context, index) {
                            return ExternalGradeShimmerWidget();
                          },
                          itemCount: 5,
                        ),
                      ),
                    )
                  else
                    if (provider.hasError)
                    Expanded(
                      child: ErrorTextWidget(
                        onRefresh: provider.refreshList,
                      ),
                    )
                  else if (provider.items.isNotEmpty)
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: provider.refreshList,
                        backgroundColor: styles.white,
                        child: ListView.separated(
                          controller: provider.scrollController,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          // padding: EdgeInsets.symmetric(
                          //   vertical: 27.h,
                          // ),
                          separatorBuilder: (context, index) {
                            if (index == provider.listCount) {
                              return const SizedBox.shrink();
                            }
                            return 10.verticalSpace;
                          },
                          itemBuilder: (context, index) {
                            if (index == provider.items.length) {
                              if (provider.isGettingMore) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return SizedBox.shrink();
                            }
                            return GradeInfoWidget(
                              controller: GradeDetailVM(
                                model: provider.items[index],
                              ),
                            );
                          },
                          itemCount: provider.listCount,
                        ),
                      ),
                    ),

                  // Expanded(
                  //   child: ListView.separated(
                  //     padding: EdgeInsets.symmetric(vertical: 8.h),
                  //     itemBuilder: (context, index) {
                  //       return GradeInfoWidget();
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return 10.verticalSpace;
                  //     },
                  //     itemCount: 20,
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
