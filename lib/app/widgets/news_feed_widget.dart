import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/widgets/poll_widget.dart';
import 'package:hive_mobile/features/home/screens/news_feed/models/mock_news_feed_model.dart';
import 'package:hive_mobile/features/home/screens/news_feed/screens/blue_border_container.dart';

import '../constants/svg_icons.dart';

class NewsFeedWidget extends StatelessWidget {
  final PostType type;

  const NewsFeedWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      "1",
      "2",
      "3",
    ];
    var selected = "1";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: appTheme(context).white,
          borderRadius: BorderRadius.circular(25)),
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
                    style: appTheme(context)
                        .inter16w600
                        .copyWith(color: appTheme(context).darkSlateGrey),
                  ),
                  Text(
                    _user.time,
                    style: appTheme(context)
                        .inter8w400
                        .copyWith(color: appTheme(context).darkGrey),
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            _user.description,
            style: appTheme(context)
                .inter16w400
                .copyWith(color: appTheme(context).black),
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
            children: [
              BlueBorderContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgIcons.like),
                    6.5.horizontalSpace,
                    Text(
                      _user.likeCount,
                      style: appTheme(context)
                          .inter12w400
                          .copyWith(color: appTheme(context).skyBlue),
                    ),
                  ],
                ),
              ),
              9.horizontalSpace,
              BlueBorderContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _user.disLikeCount,
                      style: appTheme(context)
                          .inter12w400
                          .copyWith(color: appTheme(context).skyBlue),
                    ),
                    6.5.horizontalSpace,
                    SvgPicture.asset(SvgIcons.dislike),
                  ],
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

enum PostType { image, poll }
