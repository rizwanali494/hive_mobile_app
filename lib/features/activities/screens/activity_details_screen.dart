import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/features/activities/models/activity_model.dart';

import '../../../app/resources/app_theme.dart';

class ActivityDetailScreen extends StatefulWidget {
  const ActivityDetailScreen({Key? key}) : super(key: key);
  static const route = '/ActivityDetailScreen';

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 393.w,
            height: 385.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(_activity.imageUrl), fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 18.w, right: 25.w, bottom: 31.h),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: styles.white,
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _activity.title,
                          style:
                              styles.inter20w700.copyWith(color: styles.white),
                        ),
                        Text(
                          _activity.dayTime,
                          style:
                              styles.inter16w400.copyWith(color: styles.white),
                        ),
                      ],
                    ),
                    SvgPicture.asset(SvgIcons.calender),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _activity = ActivityModel.activity;
