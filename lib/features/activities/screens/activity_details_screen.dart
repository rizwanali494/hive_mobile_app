import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/features/activities/models/activity_model.dart';

import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/activities/view_models/activity_widget_vm.dart';
import 'package:hive_mobile/features/activities/widgets/activity_detail_widget.dart';
import 'package:hive_mobile/features/activities/screens/activity_status_widget.dart';

class ActivityDetailScreen extends StatelessWidget {
  final ActivityWidgetVM controller;
  final ActivityScreenVM? activityProvider;

  const ActivityDetailScreen(
      {Key? key, required this.controller, required this.activityProvider})
      : super(key: key);
  static const route = '/ActivityDetailScreen';

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: controller.bannerImageUrl!,
            placeholder: (context, url) => Container(
              width: 393.w,
              height: 385.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              width: 393.w,
              height: 385.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(controller.bannerImageUrl!),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(colors: [
                  styles.white,
                  styles.black,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                        colors: [
                          styles.black.withOpacity(0),
                          styles.black.withOpacity(0.9),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 18.w, right: 25.w, bottom: 31.h),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.pop();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: styles.white,
                                ),
                              ),
                              20.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      controller.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: styles.inter20w700
                                          .copyWith(color: styles.white),
                                    ),
                                    Text(
                                      "${controller.eventDay} ${AppStrings.at} ${controller.eventTime}",
                                      maxLines: 1,
                                      style: styles.inter16w400
                                          .copyWith(color: styles.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      10.horizontalSpace,
                                      Text(
                                        controller.dateOnly,
                                        style: styles.inter12w400
                                            .copyWith(color: styles.white),
                                      ),
                                      Text(
                                        controller.monthOnly,
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
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          20.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ActivityDetailWidget(
                            title: controller.campusName,
                            iconPath: SvgIcons.campusLocation,
                          ),
                          ActivityDetailWidget(
                            title:
                                "${AppStrings.eventBy}: ${controller.eventBy}",
                            iconPath: SvgIcons.userBlue,
                          ),
                          ActivityDetailWidget(
                            title:
                                "${controller.peopleGoing} ${AppStrings.peopleGoing}",
                            iconPath: SvgIcons.archiveTick,
                          ),
                          12.verticalSpace,
                          Text(
                            data(),
                            style: styles.inter12w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(bottom: 27.h),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            activityProvider?.setActivitySelection(
                                model: controller.model,
                                state: AppStrings.attending);
                          },
                          child: ActivityStatusWidget(
                            iconPath: SvgIcons.tickSquare,
                            title: AppStrings.attending,
                            isSelected: controller.isSelected(
                              ActivityStatus.Attending,
                            ),
                          ),
                        ),
                        12.17.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            activityProvider?.setActivitySelection(
                                model: controller.model,
                                state: AppStrings.SKEPTICAL);
                          },
                          child: ActivityStatusWidget(
                            iconPath: SvgIcons.maybe,
                            title: AppStrings.maybe,
                            isSelected: controller.isSelected(
                              ActivityStatus.Maybe,
                            ),
                          ),
                        ),
                        12.17.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            activityProvider?.setActivitySelection(
                                model: controller.model,
                                state: AppStrings.NON_ATTENDING);
                          },
                          child: ActivityStatusWidget(
                            iconPath: SvgIcons.undecided,
                            title: AppStrings.undecided,
                            isSelected: controller.isSelected(
                              ActivityStatus.Undecided,
                            ),
                          ),
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
