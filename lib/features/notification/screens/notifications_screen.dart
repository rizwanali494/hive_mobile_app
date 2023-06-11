import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/bottom_sheet_builder.dart';

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
            _Tile(
              onTap: () {},
              svgIconPath: SvgIcons.newMessage,
              title: AppStrings.youHaveANewMessage,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            _Tile(
              onTap: () {},
              svgIconPath: SvgIcons.poll,
              title: AppStrings.aPollStartedClickToParticipate,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            _Tile(
              onTap: () {},
              svgIconPath: SvgIcons.game,
              iconColor:styles.yellowGreen,
              title: AppStrings.sportsEventIsComing,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            _Tile(
              onTap: () {},
              svgIconPath: SvgIcons.newMessage,
              title: AppStrings.youHaveAUnreadMessage,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            _Tile(
              onTap: () {},
              svgIconPath: SvgIcons.announcement,
              title: AppStrings.announcement,
              trailing: AppStrings.time,
            ),
            const Divider(color: Colors.black45),
            _Tile(
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

class _Tile extends StatelessWidget {
  const _Tile({
    required this.onTap,
    required this.svgIconPath,
    required this.title,
    required this.trailing,
    this.iconColor,
  });

  final VoidCallback onTap;
  final String svgIconPath;
  final String title;
  final String trailing;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final titleTextStyle = styles.inter14w600.copyWith(fontWeight: FontWeight.w500);
    return ListTile(
      visualDensity: const VisualDensity(vertical: -3, horizontal: 0.0),
      // minVerticalPadding: 20.h,
      minLeadingWidth: 0,
      horizontalTitleGap: 29.w,
      onTap: onTap,
      contentPadding: EdgeInsets.only(
        top: 5.h,
        bottom: 5.h,
      ),
      leading: SvgPicture.asset(
        svgIconPath,
        height: 17.h,
        width: 17.w,
        color: iconColor,
      ),
      title: Text(
        title,
        style: titleTextStyle,
      ),
      trailing: Text(
        trailing,
        style: styles.inter10w400,
      ),
    );
  }
}