import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/features/home/screens/news_feed/models/mock_news_feed_model.dart';
import 'package:hive_mobile/features/home/screens/news_feed/screens/blue_border_container.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

import '../constants/svg_icons.dart';

class NewsFeedWidget extends StatelessWidget {
  const NewsFeedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
