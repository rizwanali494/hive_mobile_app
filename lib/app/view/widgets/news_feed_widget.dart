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

class NewsFeedWidget extends StatefulWidget {
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
  State<NewsFeedWidget> createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  // int count = 0;
  final ValueNotifier<int> count = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final newsFeedVM = context.read<NewsFeedVM>();
    print("count --- ${count.value}");

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding?.w ?? 12.w, vertical: 12.h),
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
              if (widget.controller.userImage != null)
                CachedNetworkImage(
                  imageUrl: widget.controller.userImage!,
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
                    widget.controller.userName,
                    style: styles.inter16w600
                        .copyWith(color: styles.darkSlateGrey),
                  ),
                  Text(
                    widget.controller.postTime,
                    style: styles.inter8w400.copyWith(color: styles.darkGrey),
                  ),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            widget.controller.description,
            style: styles.inter16w400.copyWith(color: styles.black),
          ),
          if (widget.controller.isPost)
            if (widget.controller.attachments?.isNotEmpty ?? false)
              Stack(
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
                              this.count.value = index;
                            },
                            reverse: false),
                        items: widget.controller.attachments!.map((url) {
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
                  ValueListenableBuilder<int>(
                    valueListenable: this.count,
                    builder: (context,value,child) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(
                              right: 15.w,
                              top: 30.w
                          ),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: styles.black.withOpacity(0.6)  ,
                              borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Text(
                            "${count.value+1}/${widget.controller.attachments?.length}",
                            style: styles.inter12w400.copyWith(
                                color: styles.white
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
                  for (var element in widget.controller.polls)
                    GestureDetector(
                      onTap: () async {
                        await newsFeedVM.selectPoll(element,
                            model: widget.controller.model);
                      },
                      child: PollWidget(
                        controller: PollWidgetVM(
                          poll: element,
                          totalPolls: widget.controller.totalSelectors ?? 0,
                          selectedPollId:
                              newsFeedVM.selectedPollId(widget.controller.model),
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
                isSelected: widget.controller.isLiked,
                onTap: () {
                  newsFeedVM.likePost(widget.controller.model);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(SvgIcons.like),
                    6.5.horizontalSpace,
                    Text(
                      widget.controller.likes,
                      style: styles.inter12w400.copyWith(color: styles.skyBlue),
                    ),
                  ],
                ),
              ),
              9.horizontalSpace,
              BlueBorderContainer(
                isSelected: widget.controller.isDisliked,
                onTap: () {
                  newsFeedVM.dislikePost(widget.controller.model);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.controller.dislikes,
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
