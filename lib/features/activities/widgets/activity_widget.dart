import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/widgets/user_placeholder_widget.dart';
import 'package:hive_mobile/features/activities/screens/activity_status_widget.dart';

import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/activities/view_models/activity_widget_vm.dart';
import 'package:hive_mobile/features/news_feed/models/mock_news_feed_model.dart';
import 'package:provider/provider.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityWidgetVM controller;

  const ActivityWidget({
    super.key,
    required this.type,
    required this.selected,
    required this.controller,
  });

  final PostType type;
  final String selected;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final activityProvider = context.read<ActivityScreenVM>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: styles.white,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          5.verticalSpace,
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: controller.ownerImageUrl,
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
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  activityProvider.setActivitySelection(
                      model: controller.model, state: AppStrings.attending);
                },
                child: ActivityStatusWidget(
                  iconPath: SvgIcons.tickSquare,
                  title: AppStrings.attending,
                  isSelected: controller.isSelected(
                    ActivityStatus.Attending,
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
                  isSelected: controller.isSelected(ActivityStatus.Maybe),
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
                  title: AppStrings.undecided,
                  isSelected: controller.isSelected(ActivityStatus.Undecided),
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
