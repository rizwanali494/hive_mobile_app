import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/blue_border_container.dart';
import 'package:hive_mobile/app/view/widgets/poll_widget.dart';
import 'package:hive_mobile/app/view/widgets/user_placeholder_widget.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_vm.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_widget_vm.dart';
import 'package:hive_mobile/features/news_feed/view_models/poll_widget_vm.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:provider/provider.dart';

class NewsFeedWidget extends StatelessWidget {
  final PostType type;
  final NewsFeedWidgetVm controller;
  final double? horizontalPadding;

  const NewsFeedWidget({
    super.key,
    required this.type,
    this.horizontalPadding,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final newsFeedVM = context.read<NewsFeedVM>();
 final ValueNotifier<int> count = ValueNotifier<int>(0);

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding?.w ?? 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: styles.white,
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          5.verticalSpace,
          Row(
            children: [
              if (controller.userImage != null)
                CachedNetworkImage(
                  imageUrl: controller.userImage!,
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
                    controller.userName,
                    style: styles.inter16w600
                        .copyWith(color: styles.darkSlateGrey),
                  ),
                  Text(
                    controller.postTime,
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
          if (controller.isPost)
            if (controller.attachments?.isNotEmpty ?? false)
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 23.h, bottom: 13.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            aspectRatio: 0.89,
                            autoPlay: true,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              // controller.setCurrentImageIndex(index);
                              count.value = index;
                            },
                            reverse: false),
                        items: controller.attachments!.map((url) {
                          return Builder(
                            builder: (BuildContext context) {
                              return CachedNetworkImage(
                                imageUrl: url ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              );
                            },
                          );
                        }).toList(),
                        // child: AspectRatio(
                        //   aspectRatio: 0.89,
                        //   child: CachedNetworkImage(
                        //     imageUrl: controller.attachment,
                        //     fit: BoxFit.cover,
                        //     placeholder: (context, url) =>
                        //         Center(child: CircularProgressIndicator()),
                        //     errorWidget: (context, url, error) => Icon(Icons.error),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  // ValueListenableBuilder<int>(
                  //   valueListenable: count,
                  //   builder: (context,value,child) {
                  //     return Align(
                  //       alignment: Alignment.topRight,
                  //       child: Container(
                  //         margin: EdgeInsets.only(
                  //             right: 15.w,
                  //             top: 30.w
                  //         ),
                  //         padding: EdgeInsets.all(6),
                  //         decoration: BoxDecoration(
                  //             color: styles.black.withOpacity(0.6)  ,
                  //           borderRadius: BorderRadius.circular(8.r)
                  //         ),
                  //         child: Text(
                  //           "${value}/${controller.attachments?.length}",
                  //           style: styles.inter12w400.copyWith(
                  //               color: styles.white
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // ),

                ],
              )
            else
              26.verticalSpace
          else
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var element in controller.polls)
                    GestureDetector(
                      onTap: () async {
                        await newsFeedVM.selectPoll(element,
                            model: controller.model);
                      },
                      child: PollWidget(
                        controller: PollWidgetVM(
                          poll: element,
                          totalPolls: controller.totalSelectors ?? 0,
                          selectedPollId:
                              newsFeedVM.selectedPollId(controller.model),
                        ),
                      ),
                    ),
                  // if (true) ...[
                  //   Padding(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  //     child: Text(
                  //       "${AppStrings.pollsClosed} • ${controller.totalSelectors?.toInt()} ${AppStrings.votes}",
                  //       style: styles.inter12w400Italic,
                  //     ),
                  //   ),
                  //   15.verticalSpace,
                  // ],
                ],
              ),
            ),
          Row(
            children: [
              BlueBorderContainer(
                isSelected: controller.isLiked,
                onTap: () {
                  newsFeedVM.likePost(controller.model);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgIcons.like),
                    6.5.horizontalSpace,
                    Text(
                      controller.likes,
                      style: styles.inter12w400.copyWith(color: styles.skyBlue),
                    ),
                  ],
                ),
              ),
              9.horizontalSpace,
              BlueBorderContainer(
                isSelected: controller.isDisliked,
                onTap: () {
                  newsFeedVM.dislikePost(controller.model);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.dislikes,
                      style: styles.inter12w400.copyWith(color: styles.skyBlue),
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
