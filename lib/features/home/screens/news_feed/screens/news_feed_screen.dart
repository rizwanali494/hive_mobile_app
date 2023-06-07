import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/constants/svg_icons.dart';
import 'package:hive_mobile/features/home/screens/news_feed/models/mock_news_feed_model.dart';
import 'package:hive_mobile/res/app_theme.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(MockNewsFeedModel.userAvatar),
                radius: 42,
              ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user.name,
                    style: colors(context).inter16w600,
                  ),
                  Text(
                    _user.time,
                    style: colors(context).inter8w400,
                  ),
                ],
              ),
            ],
          ),
          19.verticalSpace,
          Text(
            _user.description,
            style: colors(context).inter16w400,
          ),
          23.verticalSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(_user.universityImage),
              width: 333.w,
              height: 221.h,
            ),
          ),
          13.verticalSpace,
          Container(
            height: 29.h,
            width: 75.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: colors(context).skyBlue)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(SvgIcons.like),
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
          Container(
            height: 29.h,
            width: 75.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: colors(context).skyBlue)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(SvgIcons.dislike),
                6.5.horizontalSpace,
                Text(
                  _user.disLikeCount,
                  style: colors(context)
                      .inter12w400
                      .copyWith(color: colors(context).skyBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const _user = (
  name: MockNewsFeedModel.userName,
  userImage: MockNewsFeedModel.userAvatar,
  time: MockNewsFeedModel.time,
  universityImage: MockNewsFeedModel.universityImage,
  description: MockNewsFeedModel.description,
  likeCount: MockNewsFeedModel.description,
  disLikeCount: MockNewsFeedModel.disLikeCount,
);
