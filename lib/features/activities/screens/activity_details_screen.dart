import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/features/activities/models/activity_model.dart';

import '../../../app/resources/app_strings.dart';
import '../../../app/resources/app_theme.dart';
import '../widgets/activity_detail_widget.dart';
import 'activity_status_widget.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                              style: styles.inter20w700
                                  .copyWith(color: styles.white),
                            ),
                            Text(
                              _activity.dayTime,
                              style: styles.inter16w400
                                  .copyWith(color: styles.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IntrinsicHeight(
                      child: IntrinsicWidth(
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              SvgIcons.calenderBorder,
                            ),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  10.horizontalSpace,
                                  Text(
                                    _activity.date,
                                    style: styles.inter12w400
                                        .copyWith(color: styles.white),
                                  ),
                                  Text(
                                    _activity.month,
                                    style: styles.inter8w400
                                        .copyWith(color: styles.white),
                                  ),
                                  5.horizontalSpace,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  ActivityDetailWidget(
                    title: _activity.campusName,
                    iconPath: SvgIcons.campusLocation,
                  ),
                  ActivityDetailWidget(
                    title: "${AppStrings.eventBy}: ${_activity.eventBy}",
                    iconPath: SvgIcons.userBlue,
                  ),
                  ActivityDetailWidget(
                    title: "${_activity.peopleNumber} ${AppStrings.peopleGoing}",
                    iconPath: SvgIcons.archiveTick,
                  ),
                  12.verticalSpace,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        data(),
                        style: styles.inter12w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 27.h
                    ),
                    child: Row(
                      children: [
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String data() =>
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra ex ut sapien bibendum, nec cursus arcu scelerisque. Mauris ac purus felis. Aenean pellentesque auctor consequat. Nulla facilisi. Cras interdum vestibulum lacus et auctor. Sed eu ante ac ante imperdiet molestie. Vestibulum a pretium risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra ex ut sapien bibendum, nec cursus arcu scelerisque. Mauris ac purus felis. Aenean pellentesque auctor consequat. Nulla facilisi. Cras interdum vestibulum lacus et auctor. Sed eu ante ac ante imperdiet molestie. Vestibulum a pretium risus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra ex ut sapien bibendum, nec cursus arcu scelerisque. Mauris ac purus felis. Aenean pellentesque auctor consequat. Nulla facilisi. Cras interdum vestibulum lacus et auctor. Sed eu ante ac ante imperdiet molestie. Vestibulum a pretium risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra ex ut sapien bibendum, nec cursus arcu scelerisque. Mauris ac purus felis. Aenean pellentesque auctor consequat. Nulla facilisi. Cras interdum vestibulum lacus et auctor. Sed eu ante ac ante imperdiet molestie. Vestibulum a pretium risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra ex ut sapien bibendum, nec cursus arcu scelerisque. Mauris ac purus felis. Aenean pellentesque auctor consequat. Nulla facilisi. Cras interdum vestibulum lacus et auctor. Sed eu ante ac ante imperdiet molestie. Vestibulum a pretium risus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra ex ut sapien bibendum, nec cursus arcu scelerisque. Mauris ac purus felis. Aenean pellentesque auctor consequat. Nulla facilisi. Cras interdum vestibulum lacus et auctor. Sed eu ante ac ante imperdiet molestie. Vestibulum a pretium risus.";
}

const _activity = ActivityModel.activity;
