import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/notification/view_models/notfication_tile_vm.dart';
import 'package:hive_mobile/features/notification/view_models/notification_screen_vm.dart';
import 'package:hive_mobile/features/notification/widgets/notification_shimmer_widget.dart';
import 'package:hive_mobile/features/notification/widgets/notification_tile.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => NotificationScreenVM(),
        child: Consumer<NotificationScreenVM>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBarWidget(
                  color: styles.black,
                  title: AppStrings.notifications,
                  horizontalPadding: 14,
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
                          return NotificationShimmerWidget();
                        },
                        itemCount: 12,
                      ),
                    ),
                  )
                else if (provider.hasError)
                  Expanded(
                    child: ErrorTextWidget(
                      onRefresh: provider.refreshNotificationList,
                    ),
                  )
                else if (provider.notificationList.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 19.w,
                      ),
                      child: RefreshIndicator(
                        onRefresh: provider.refreshNotificationList,
                        backgroundColor: styles.white,
                        child: ListView.separated(
                          controller: provider.scrollController,
                          padding: EdgeInsets.symmetric(
                            vertical: 27.h,
                          ),
                          separatorBuilder: (context, index) {
                            // if (index == provider.listCount) {
                            //   return const SizedBox.shrink();
                            // }

                            return buildDivider();
                          },
                          itemBuilder: (context, index) {
                            if (index == provider.notificationList.length) {
                              if (provider.isGettingMore) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              return SizedBox.shrink();
                            }
                            return NotificationTile(
                              onTap: () {},
                              svgIconPath: svgIcons[index % svgIcons.length],
                              controller: NotificationTileVM(
                                model: provider.notificationList[index],
                              ),
                            );
                          },
                          itemCount: provider.listCount,
                        ),
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

  final titles = [
    AppStrings.youHaveANewMessage,
    AppStrings.aPollStartedClickToParticipate,
    AppStrings.sportsEventIsComing,
    AppStrings.youHaveAUnreadMessage,
    AppStrings.announcement,
    AppStrings.sportsEventIsComing,
  ];

  final trailingTitles = [
    AppStrings.time,
  ];

  final svgIcons = [
    SvgIcons.newMessage,
    SvgIcons.poll,
    SvgIcons.game,
    SvgIcons.newMessage,
    SvgIcons.announcement,
    SvgIcons.newMessage,
  ];

  Divider buildDivider() => Divider(color: Colors.black.withOpacity(0.2));
}
