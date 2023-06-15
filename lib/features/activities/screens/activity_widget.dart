import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/features/activities/screens/activity_status_widget.dart';

import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/poll_widget.dart';
import 'package:hive_mobile/features/home/screens/news_feed/models/mock_news_feed_model.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.type,
    required this.selected,
  });

  final PostType type;
  final String selected;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

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
              CircleAvatar(
                backgroundImage: NetworkImage(_user.userAvatar),
                radius: 25,
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user.name,
                    style: styles.inter16w600
                        .copyWith(color: styles.darkSlateGrey),
                  ),
                  Text(
                    _user.time,
                    style: styles.inter8w400.copyWith(color: styles.darkGrey),
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            _user.description,
            style: styles.inter16w400.copyWith(color: styles.black),
          ),
          if (type == PostType.image)
            Padding(
              padding: EdgeInsets.only(top: 23.h, bottom: 13.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(_user.universityImage),
                  width: 333.w,
                  fit: BoxFit.cover,
                  height: 221.h,
                ),
              ),
            )
          else
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                children: [
                  PollWidget(
                    selected: selected,
                    isSelected: true,
                    value: "1",
                    percentage: .67,
                  ),
                  PollWidget(
                    selected: selected,
                    value: "2",
                    isSelected: false,
                    percentage: .4,
                  ),
                ],
              ),
            ),
          Row(
            children:  [
              ActivityStatusWidget(
                iconPath: SvgIcons.tickSquare,
                title: AppStrings.attending,
              ),
              6.17.horizontalSpace,
              ActivityStatusWidget(
                iconPath: SvgIcons.maybe,
                title: AppStrings.maybe,
              ),
              6.17.horizontalSpace,
              ActivityStatusWidget(
                iconPath: SvgIcons.undecided,
                title: AppStrings.undecided,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const _user = MockNewsFeedModel.user;
