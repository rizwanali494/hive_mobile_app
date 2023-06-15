import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/bottom_sheet_builder.dart';
import 'package:hive_mobile/features/notification/widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return BottomSheetBuilder(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 41.w, vertical: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.notifications,
              style: styles.inter40w700,
            ),
            37.verticalSpace,
            NotificationTile(
              onTap: () {},
              svgIconPath: SvgIcons.newMessage,
              title: AppStrings.youHaveANewMessage,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            NotificationTile(
              onTap: () {},
              svgIconPath: SvgIcons.poll,
              title: AppStrings.aPollStartedClickToParticipate,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            NotificationTile(
              onTap: () {},
              svgIconPath: SvgIcons.game,
              iconColor: styles.yellowGreen,
              title: AppStrings.sportsEventIsComing,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            NotificationTile(
              onTap: () {},
              svgIconPath: SvgIcons.newMessage,
              title: AppStrings.youHaveAUnreadMessage,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            NotificationTile(
              onTap: () {},
              svgIconPath: SvgIcons.announcement,
              title: AppStrings.announcement,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            NotificationTile(
              onTap: () {},
              svgIconPath: SvgIcons.newMessage,
              title: AppStrings.youHaveAUnreadMessage,
              trailing: AppStrings.time,
            ),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}