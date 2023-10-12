import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/my_services/view_models/service_widget_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/service_screen_vm.dart';
import 'package:hive_mobile/features/my_services/widget/my_service_widget.dart';
import 'package:hive_mobile/features/my_services/screens/new_request_screen.dart';
import 'package:hive_mobile/features/my_services/widget/service_count_widget.dart';
import 'package:hive_mobile/features/my_services/widget/services_shimmer_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/blue_action_button.dart';
import 'package:provider/provider.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({Key? key}) : super(key: key);
  static const route = "/MyServices";

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ServiceScreenVM(),
      child: Consumer<ServiceScreenVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 19.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(
                    color: styles.black,
                    title: AppStrings.myServices,
                    horizontalPadding: 0,
                  ),
                  26.verticalSpace,
                  BlueActionButton(
                    onTap: () async {
                      bool val =
                          await context.push(NewRequestScreen.route) ?? false;
                      if (val) {
                        provider.refreshList();
                      }
                    },
                    title: AppStrings.initiateRequest,
                  ),
                  21.verticalSpace,
                  Row(
                    children: [
                      ServiceCountWidget(
                        color: styles.yellowGreen,
                        count: provider.totalPending.toString(),
                        type: AppStrings.openRequest,
                      ),
                      13.horizontalSpace,
                      ServiceCountWidget(
                        color: styles.darkOrange,
                        count: (provider.totalApproved + provider.totalRejected)
                            .toString(),
                        type: AppStrings.closedRequest,
                      ),
                      // 13.horizontalSpace,
                      // ServiceCountWidget(
                      //   color: styles.red,
                      //   count: provider.totalRejected.toString(),
                      //   type: AppStrings.rejected,
                      // ),
                    ],
                  ),
                  34.verticalSpace,
                  Text(
                    AppStrings.myRequest,
                    style: styles.inter20w700,
                  ),
                  5.verticalSpace,
                  if (provider.isLoading)
                    Expanded(
                      child: ListView.separated(
                        itemCount: 12,
                        padding: EdgeInsets.symmetric(
                          vertical: 19.h,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: ServicesShimmerWidget(),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 20.h),
                            child: Divider(
                              color: styles.black.withOpacity(0.3),
                              height: 1,
                            ),
                          )..animate(
                              onComplete: (controller) => controller.repeat(),
                            ).shimmer(
                              color: styles.greyShade200,
                              duration: const Duration(seconds: 2),
                            );
                        },
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
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index == provider.items.length) {
                              if (provider.isGettingMore) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return SizedBox.shrink();
                            }

                            return GestureDetector(
                              onTap: () {
                                context.push(DescriptionScreen.route, extra: {
                                  "description":
                                      provider.items[index].description,
                                  "title": "Comment"
                                });
                              },
                              child: MyServiceWidget(
                                controller: ServiceWidgetVM(
                                  model: provider.items[index],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return 10.verticalSpace;
                          },
                          itemCount: provider.listCount,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
