import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/user_placeholder_widget.dart';
import 'package:hive_mobile/features/inbox/view_models/inboxtile_widget_vm.dart';

class InboxListTile extends StatelessWidget {
  final InboxTileWidgetVM controller;

  const InboxListTile({
    super.key,
    this.onTap,
    this.iconColor,
    this.contentPadding,
    required this.controller,
  });

  final VoidCallback? onTap;
  final Color? iconColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final titleTextStyle = styles.inter14w600;
    return ListTile(
      visualDensity: const VisualDensity(
        horizontal: 0.0,
      ),
      minVerticalPadding: 0.h,
      minLeadingWidth: 0,
      horizontalTitleGap: 16.w,
      onTap: onTap,
      contentPadding: contentPadding ??
          EdgeInsets.only(
            top: 5.h,
            bottom: 5.h,
          ),
      // leading: const CircleAvatar(
      //   backgroundImage: NetworkImage(
      //     NetworkImages.userUrl,
      //   ),
      //   radius: 23,
      // ),
      leading: CachedNetworkImage(
        imageUrl: controller.userImage,
        imageBuilder: (context, imageProvider) => Container(
          width: 45.h,
          height: 45.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const UserPlaceHolderWidget(),
        errorWidget: (context, url, error) => const UserPlaceHolderWidget(),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.name,
            style: titleTextStyle,
          ),
          3.verticalSpace,
          Text(
            controller.content,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: styles.inter10w400.copyWith(
              color: styles.darkGrey,
            ),
          ),
        ],
      ),
      // trailing: trailing ?? const SizedBox.shrink(),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            controller.time,
            style: styles.inter10w400
                .copyWith(color: styles.black.withOpacity(0.5)),
          ),
          7.verticalSpace,
          Container(
            height: 7.h,
            width: 7.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: styles.linearBlueGradientTopLeft,
            ),
          ),
        ],
      ),
    );
  }
}