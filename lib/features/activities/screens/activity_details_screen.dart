import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/activities/screens/activity_status_widget.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_vm.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/activities/widgets/activity_detail_widget.dart';
import 'package:provider/provider.dart';

class ActivityDetailScreen extends StatefulWidget {
  final ActivityDetailVM controller;
  final ActivityScreenVM? activityProvider;

  const ActivityDetailScreen(
      {Key? key, required this.controller, required this.activityProvider})
      : super(key: key);
  static const route = '/ActivityDetailScreen';

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: Scaffold(
        body: Consumer<ActivityDetailVM>(
          builder: (context, provider, child) {
            if (provider.state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (provider.state.hasError) {
              return Center(
                child: Text(AppStrings.somethingWentWrong),
              );
            }

            return Column(
              children: [
                Container(
                  width: 393.w,
                  height: 385.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (widget.controller.bannerImageUrl != null)
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.controller.bannerImageUrl!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: (context, url) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) => Center(
                              child: Icon(Icons.error),
                            ),
                          ),
                        ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              styles.black.withOpacity(0),
                              styles.black.withOpacity(0.9),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 18.w, right: 25.w, bottom: 31.h),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            widget.controller.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: styles.inter20w700
                                                .copyWith(color: styles.white),
                                          ),
                                          Text(
                                            "${widget.controller.eventDay} ${AppStrings.at} ${widget.controller.eventTime}",
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
                                              widget.controller.dateOnly,
                                              style: styles.inter12w400
                                                  .copyWith(
                                                      color: styles.white),
                                            ),
                                            Text(
                                              widget.controller.monthOnly,
                                              style: styles.inter8w400.copyWith(
                                                  color: styles.white),
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
                    ],
                  ),
                ),
                20.verticalSpace,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ValueListenableBuilder(
                      valueListenable: widget.controller.selectionStatus,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ActivityDetailWidget(
                                      title: widget.controller.campusName,
                                      iconPath: SvgIcons.campusLocation,
                                    ),
                                    ActivityDetailWidget(
                                      title:
                                          "${AppStrings.eventBy}: ${widget.controller.eventBy}",
                                      iconPath: SvgIcons.userBlue,
                                    ),
                                    ActivityDetailWidget(
                                      title:
                                          "${widget.controller.peopleGoing} ${AppStrings.peopleGoing}",
                                      iconPath: SvgIcons.archiveTick,
                                    ),
                                    12.verticalSpace,
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        widget.controller.description,
                                        style: styles.inter12w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            15.verticalSpace,
                            if (!provider.model.hasExpired)
                              Padding(
                                padding: EdgeInsets.only(bottom: 27.h),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        widget.controller.isSelected(
                                                ActivitySelectionStatus
                                                    .Attending)
                                            ? null
                                            : widget.controller
                                                .setActivitySelection(
                                                    state: AppStrings.attending,
                                                    activityScreenVM: widget
                                                        .activityProvider);
                                        // widget.activityProvider?.setActivitySelection(
                                        //     model: widget.controller.model,
                                        //     state: AppStrings.attending);
                                      },
                                      child: ActivityStatusWidget(
                                        iconPath: SvgIcons.tickSquare,
                                        title: AppStrings.attending,
                                        isSelected:
                                            widget.controller.isSelected(
                                          ActivitySelectionStatus.Attending,
                                        ),
                                      ),
                                    ),
                                    12.17.horizontalSpace,
                                    GestureDetector(
                                      onTap: () async {
                                        widget.controller.isSelected(
                                          ActivitySelectionStatus.Maybe,
                                        )
                                            ? null
                                            : widget.controller
                                                .setActivitySelection(
                                                    state: AppStrings.SKEPTICAL,
                                                    activityScreenVM: widget
                                                        .activityProvider);
                                        //
                                        // widget.activityProvider?.setActivitySelection(
                                        //     model: widget.controller.model,
                                        //     state: AppStrings.SKEPTICAL);
                                      },
                                      child: ActivityStatusWidget(
                                        iconPath: SvgIcons.maybe,
                                        title: AppStrings.maybe,
                                        isSelected:
                                            widget.controller.isSelected(
                                          ActivitySelectionStatus.Maybe,
                                        ),
                                      ),
                                    ),
                                    12.17.horizontalSpace,
                                    GestureDetector(
                                      onTap: () {
                                        widget.controller.isSelected(
                                          ActivitySelectionStatus.Undecided,
                                        )
                                            ? null
                                            : widget.controller
                                                .setActivitySelection(
                                                    state: AppStrings
                                                        .NON_ATTENDING,
                                                    activityScreenVM: widget
                                                        .activityProvider);

                                        // widget.activityProvider?.setActivitySelection(
                                        //     model: widget.controller.model,
                                        //     state: AppStrings.NON_ATTENDING);
                                      },
                                      child: ActivityStatusWidget(
                                        iconPath: SvgIcons.undecided,
                                        title: AppStrings.not_attending,
                                        isSelected:
                                            widget.controller.isSelected(
                                          ActivitySelectionStatus.Undecided,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
