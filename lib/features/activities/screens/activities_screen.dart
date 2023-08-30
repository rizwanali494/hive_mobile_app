import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/app/view/widgets/shimmers/post_shimmer_widget.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/activities/widgets/activity_widget.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

class ActivitiesScreen extends StatelessWidget {
  static const route = '/ActivitiesScreen';

  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    var selected = "1";

    return ChangeNotifierProvider(
      create: (BuildContext context) => ActivityScreenVM(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: styles.smokeWhite,
        ),
        child: Consumer<ActivityScreenVM>(
          builder: (context, provider, child) {
            return Column(
              children: [
                AppBarWidget(
                  color: styles.black,
                  horizontalPadding: 12,
                  title: AppStrings.activities,
                ),
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
                          return PostShimmerWidget(type: PostType.image);
                        },
                        itemCount: 12,
                      ),
                    ),
                  )
                else if (provider.hasError)
                  Expanded(
                    child: ErrorTextWidget(
                      onRefresh: provider.refreshActivities,
                    ),
                  )
                else if (provider.activities.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 19.w,
                      ),
                      child: RefreshIndicator(
                        onRefresh: provider.refreshActivities,
                        backgroundColor: styles.white,
                        child: ListView.separated(
                          controller: provider.scrollController,
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          separatorBuilder: (context, index) {
                            // if (index == provider.listCount) {
                            //   return const SizedBox.shrink();
                            // }

                            return 20.verticalSpace;
                          },
                          itemBuilder: (context, index) {
                            if (index == provider.activities.length) {
                              if (provider.isGettingMore) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return SizedBox.shrink();
                            }
                            return GestureDetector(
                              onTap: () {
                                context.push("/ActivityDetailScreen");
                              },
                              child: ActivityWidget(
                                type: index.isEven
                                    ? PostType.image
                                    : PostType.poll,
                                selected: selected,
                              ),
                            );
                          },
                          itemCount: provider.listCount,
                        ),
                      ),
                    ),
                  ),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.only(),
                //     child: ListView.separated(
                //         padding: EdgeInsets.symmetric(vertical: 12.h),
                //         itemBuilder: (context, index) {
                //           return GestureDetector(
                //             onTap: () {
                //               context.push("/ActivityDetailScreen");
                //             },
                //             child: ActivityWidget(
                //               type: index.isEven ? PostType.image : PostType.poll,
                //               selected: selected,
                //             ),
                //           );
                //         },
                //         separatorBuilder: (context, index) {
                //           return 20.verticalSpace;
                //         },
                //         itemCount: 12),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }

  Divider buildDivider() => Divider(color: Colors.black.withOpacity(0.2));
}
