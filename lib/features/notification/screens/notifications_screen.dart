import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/notification/widgets/notification_shimmer_widget.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarWidget(
            color: styles.black,
            title: AppStrings.notifications,
            horizontalPadding: 14,
          ),
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
          ),

          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 19.w,
          //     ),
          //     child: ListView.separated(
          //       padding: EdgeInsets.symmetric(
          //         vertical: 27.h,
          //       ),
          //       separatorBuilder: (context, index) {
          //         return buildDivider();
          //       },
          //       itemBuilder: (context, index) {
          //         return NotificationTile(
          //           onTap: () {},
          //           svgIconPath: svgIcons[index % svgIcons.length],
          //           title: titles[index % titles.length],
          //           trailing: AppStrings.time,
          //         );
          //       },
          //       itemCount: 24,
          //     ),
          //   ),
          // ),
        ],
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
