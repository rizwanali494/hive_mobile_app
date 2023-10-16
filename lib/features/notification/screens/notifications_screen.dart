import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/base_listview_widget.dart';
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
      body: Consumer<NotificationScreenVM>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBarWidget(
                color: styles.black,
                title: AppStrings.notifications,
                horizontalPadding: 14,
              ),
              BaseListViewWidget<NotificationModel>(
                controller: provider.listViewVM,
                listViewChild: (item) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 19.w,
                  ),
                  child: NotificationTile(
                    onTap: () {},
                    svgIconPath: svgIcons[0],
                    controller: NotificationTileVM(
                      model: item,
                    ),
                  ),
                ),
                listSeparatorChild: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 19.w,
                  ),
                  child: buildDivider(),
                ),
                shimmerChild: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 19.w,
                  ),
                  child: NotificationShimmerWidget(),
                ),
              )

              // if (provider.isLoading)
              //   Expanded(
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 19.w,
              //       ),
              //       child: ListView.separated(
              //         padding: EdgeInsets.symmetric(
              //           vertical: 27.h,
              //         ),
              //         separatorBuilder: (context, index) {
              //           return 20.verticalSpace;
              //         },
              //         itemBuilder: (context, index) {
              //           return NotificationShimmerWidget();
              //         },
              //         itemCount: 12,
              //       ),
              //     ),
              //   )
              // else if (provider.hasError)
              //   Expanded(
              //     child: ErrorTextWidget(
              //       onRefresh: provider.refreshList,
              //     ),
              //   )
              // else if (provider.items.isNotEmpty)
              //   Expanded(
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 19.w,
              //       ),
              //       child: RefreshIndicator(
              //         onRefresh: provider.refreshList,
              //         backgroundColor: styles.white,
              //         child: ListView.separated(
              //           controller: provider.scrollController,
              //           padding: EdgeInsets.symmetric(
              //             vertical: 27.h,
              //           ),
              //           separatorBuilder: (context, index) {
              //             return buildDivider();
              //           },
              //           itemBuilder: (context, index) {
              //             if (index == provider.items.length) {
              //               if (provider.isGettingMore) {
              //                 return Center(child: CircularProgressIndicator());
              //               }
              //               return SizedBox.shrink();
              //             }
              //             return NotificationTile(
              //               onTap: () {},
              //               svgIconPath: svgIcons[index % svgIcons.length],
              //               controller: NotificationTileVM(
              //                 model: provider.items[index],
              //               ),
              //             );
              //           },
              //           itemCount: provider.listCount,
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          );
        },
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

  // final svgIcons = {
  //   "ANNOUNCEMENT_POST": SvgIcons.announcement,
  //   "ACTIVITY": SvgIcons.game,
  // };

  Divider buildDivider() => Divider(color: Colors.black.withOpacity(0.2));
}
