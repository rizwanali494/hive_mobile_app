import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/features/home/screens/news_feed/models/mock_news_feed_model.dart';
import 'package:hive_mobile/features/home/screens/news_feed/screens/blue_border_container.dart';
import 'package:hive_mobile/res/app_theme.dart';

import '../../../../../constants/svg_icons.dart';

class NewsFeedWidget extends StatelessWidget {
  const NewsFeedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: colors(context).white,
          borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          5.verticalSpace,
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(MockNewsFeedModel.userAvatar),
                radius: 25,
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user.name,
                    style: colors(context)
                        .inter16w600
                        .copyWith(color: colors(context).darkSlateGrey),
                  ),
                  Text(
                    _user.time,
                    style: colors(context)
                        .inter8w400
                        .copyWith(color: colors(context).darkGrey),
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            _user.description,
            style: colors(context)
                .inter16w400
                .copyWith(color: colors(context).black),
          ),
          23.verticalSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(_user.universityImage),
              width: 333.w,
              fit: BoxFit.cover,
              height: 221.h,
            ),
          ),
          13.verticalSpace,
          Row(
            children: [
              BlueBorderContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgIcons.dislike),
                    6.5.horizontalSpace,
                    Text(
                      _user.likeCount,
                      style: colors(context)
                          .inter12w400
                          .copyWith(color: colors(context).skyBlue),
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
                      style: colors(context)
                          .inter12w400
                          .copyWith(color: colors(context).skyBlue),
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
