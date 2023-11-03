import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/my_services/screens/service_request_widget.dart';
import 'package:hive_mobile/features/my_services/view_models/all_service_request_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/close_service_request_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/open_service_request_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/service_screen_vm.dart';
import 'package:hive_mobile/features/my_services/screens/new_request_screen.dart';
import 'package:hive_mobile/features/my_services/widget/service_count_widget.dart';
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => OpenServiceRequestVM(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CloseServiceRequestVM(),
        ),
      ],
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
                  Builder(builder: (context) {
                    return BlueActionButton(
                      onTap: () async {
                        bool val =
                            await context.push(NewRequestScreen.route) ?? false;
                        if (val) {
                          provider.refreshAllList(context);
                        }
                      },
                      title: AppStrings.initiateRequest,
                    );
                  }),
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
                  Row(
                    children: [
                      Text(
                        AppStrings.myRequest,
                        style: styles.inter20w700,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                              border: Border.all(
                                color: styles.black.withOpacity(
                                  1,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 5.h,
                            ),
                            child: DropdownButton<String>(
                              isDense: true,
                              value: provider.selectedFilter,
                              // isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              dropdownColor: styles.white,
                              underline: const SizedBox(),
                              items: provider.filters
                                  .map(
                                    (value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: styles.inter12w400,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                provider.setFilter(value);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: provider.pageController,
                      children: [
                        Consumer<AllServiceRequestVM>(
                          builder: (context, provider, child) =>
                              ServiceRequestWidget(
                            provider: provider.widgetVM,
                          ),
                        ),
                        Consumer<OpenServiceRequestVM>(
                          builder: (context, provider, child) =>
                              ServiceRequestWidget(
                            provider: provider.widgetVM,
                          ),
                        ),
                        Consumer<CloseServiceRequestVM>(
                          builder: (context, provider, child) =>
                              ServiceRequestWidget(
                            provider: provider.widgetVM,
                          ),
                        ),
                      ],
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
