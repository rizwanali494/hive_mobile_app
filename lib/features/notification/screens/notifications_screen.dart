import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/notification_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/base_listview_widget.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = context.read<NotificationScreenVM?>();
      provider?.resetCount();
      context.read<HomeScreenVm?>()?.notify();
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Consumer<NotificationScreenVM>(
        builder: (context, provider, child) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            if (provider.unreadCount > 0) {
              provider.resetCount();
            }
          });
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
                    onTap: () {
                      provider.performAction(context, item);
                    },
                    svgIconPath: svgIcons[0],
                    controller: NotificationTileVM(
                      model: item,
                      mainProvider: provider,
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

  Divider buildDivider() => Divider(color: Colors.black.withOpacity(0.2));
}
