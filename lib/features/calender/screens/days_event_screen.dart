import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/extensions/date_time_extension.dart';
import 'package:hive_mobile/app/extensions/string_extension.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/activities/screens/activity_details_screen.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/activities/view_models/activity_widget_vm.dart';
import 'package:hive_mobile/features/calender/controllers/days_event_controller.dart';
import 'package:hive_mobile/features/notification/widgets/notification_shimmer_widget.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class DaysEventScreen extends StatefulWidget {
  final DateTime date;

  static const route = "/DaysEvent";

  const DaysEventScreen({super.key, required this.date});

  @override
  State<DaysEventScreen> createState() => _DaysEventScreenState();
}

class _DaysEventScreenState extends State<DaysEventScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) => DaysEventController(time: widget.date),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          child: Consumer<DaysEventController>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  DividerAppBar(
                      title: widget.date.eventDayFormat,
                      titleStyle: styles.inter20w600),
                  15.verticalSpace,
                  ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: styles.paleSkyBlue,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: headingText("Event Name")),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: headingText("Time"),
                          )),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: headingText("Location"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (provider.uiState.isLoading)
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
                              return NotificationShimmerWidget();
                            },
                            itemCount: 12,
                          ),
                        ),
                      )
                    else if (provider.uiState.hasError)
                      Expanded(
                        child: ErrorTextWidget(
                          onRefresh: provider.refreshList,
                        ),
                      )
                    else if (provider.items.isNotEmpty)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 19.w,
                          ),
                          child: RefreshIndicator(
                            onRefresh: provider.refreshList,
                            backgroundColor: styles.white,
                            child: ListView.separated(
                              controller: provider.scrollController,
                              padding: EdgeInsets.symmetric(
                                vertical: 17.h,
                              ),
                              separatorBuilder: (context, index) {
                                // if (index == provider.listCount) {
                                //   return const SizedBox.shrink();
                                // }
                                return Divider(
                                  color: styles.black.withOpacity(.2),
                                );
                              },
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
                                    context.push(
                                      ActivityDetailScreen.route,
                                      extra: {
                                        "controller": ActivityWidgetVM(
                                          model: provider.items[index],
                                        ),
                                        "activityController":
                                            ActivityScreenVM(),
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      // horizontal: 4.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: descriptionText(
                                              "${provider.items[index].name}"),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: descriptionText(
                                                "${provider.items[index].date?.timeAgo}"),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: descriptionText(
                                                "${provider.items[index].location}"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: provider.listCount,
                            ),
                          ),
                        ),
                      ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget headingText(String text) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Text(
      text,
      style: styles.inter14w600,
    );
  }

  Widget descriptionText(String text) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Text(
      text,
      style: styles.inter14w400,
    );
  }
}
