import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/widgets/user_placeholder_widget.dart';
import 'package:hive_mobile/features/activities/screens/activity_status_widget.dart';

import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_vm.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/news_feed/models/mock_news_feed_model.dart';
import 'package:provider/provider.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityDetailVM controller;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const ActivityWidget({
    super.key,
    required this.controller,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final activityProvider = context.read<ActivityScreenVM>();

    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: styles.white,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: margin ?? EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          5.verticalSpace,
          Row(
            children: [
              if (controller.ownerImageUrl != null)
                CachedNetworkImage(
                  imageUrl: controller.ownerImageUrl!,
                  maxHeightDiskCache: 300,
                  maxWidthDiskCache: 300,
                  memCacheHeight: 300,
                  memCacheWidth: 300,
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
                  errorWidget: (context, url, error) =>
                      const UserPlaceHolderWidget(),
                )
              else
                Container(
                  width: 45.h,
                  height: 45.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: UserPlaceHolderWidget(),
                ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.ownerName,
                    style: styles.inter16w600
                        .copyWith(color: styles.darkSlateGrey),
                  ),
                  Text(
                    controller.postedTime,
                    style: styles.inter8w400.copyWith(color: styles.darkGrey),
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            controller.name,
            style: styles.inter16w700.copyWith(color: styles.black),
          ),
          10.verticalSpace,
          Text(
            controller.description,
            style: styles.inter16w400.copyWith(color: styles.black),
          ),
          if (controller.bannerImageUrl != null)
            Padding(
              padding: EdgeInsets.only(top: 23.h, bottom: 13.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 0.89,
                  child: CachedNetworkImage(
                    imageUrl: controller.bannerImageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            )
          else
            33.verticalSpace,
          if (!controller.model.hasExpired)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    activityProvider.setActivitySelection(
                      model: controller.model,
                      state: AppStrings.attending,
                    );
                  },
                  child: ActivityStatusWidget(
                    iconPath: SvgIcons.tickSquare,
                    title: AppStrings.attending,
                    isSelected: controller.isSelected(
                      ActivitySelectionStatus.Attending,
                    ),
                  ),
                ),
                6.17.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    activityProvider.setActivitySelection(
                        model: controller.model, state: AppStrings.SKEPTICAL);
                  },
                  child: ActivityStatusWidget(
                    iconPath: SvgIcons.maybe,
                    title: AppStrings.maybe,
                    isSelected:
                    controller.isSelected(ActivitySelectionStatus.Maybe),
                  ),
                ),
                6.17.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    activityProvider.setActivitySelection(
                        model: controller.model, state: AppStrings.NON_ATTENDING);
                  },
                  child: ActivityStatusWidget(
                    iconPath: SvgIcons.undecided,
                    title: AppStrings.not_attending,
                    isSelected:
                    controller.isSelected(ActivitySelectionStatus.Undecided),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

const _user = MockNewsFeedModel.user;
