import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view_models/base_listview_vm.dart';

class BaseListViewWidget<T> extends StatelessWidget {
  final Widget Function(T item) listViewChild;
  final Widget Function(T item) shimmerChild;
  final BaseListViewVM controller;
  final EdgeInsets? shimmerListPadding;
  final EdgeInsets? listViewPadding;
  final double? listSeparatorValue;
  final double? shimmerSeparatorValue;

  const BaseListViewWidget({
    super.key,
    required this.controller,
    required this.listViewChild,
    required this.shimmerChild,
    this.shimmerListPadding,
    this.listViewPadding,
    this.shimmerSeparatorValue,
    this.listSeparatorValue,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    if (controller.hasError) {
      return Expanded(
        child: LayoutBuilder(
          builder: (context, constraints) => RefreshIndicator(
            onRefresh: controller.refreshList,
            backgroundColor: styles.white,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      AppStrings.somethingWentWrong,
                      style: styles.inter20w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    if (controller.isLoading) {
      return Expanded(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: (shimmerSeparatorValue ?? 12).h,
          ),
          itemBuilder: (context, index) {
            // return PostShimmerWidget(
            //   type: PostType.image,
            // );
            return shimmerChild(controller.items[index]);
          },
          separatorBuilder: (context, index) {
            return (shimmerSeparatorValue ?? 20).verticalSpace;
          },
          itemCount: 7,
        ),
      );
    }
    return Expanded(
      child: RefreshIndicator(
        // onRefresh: provider.refreshNewsFeed,
        onRefresh: controller.refreshList,
        backgroundColor: styles.white,
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: listViewPadding ??
              EdgeInsets.symmetric(
                vertical: (12).h,
              ),
          controller: controller.scrollController,
          itemBuilder: (context, index) {
            if (index == controller.items.length) {
              if (controller.isGettingMore) {
                return Center(child: CircularProgressIndicator());
              }
              return SizedBox.shrink();
            }
            // return GestureDetector(
            //   onTap: () {
            //     showDialog(
            //       context: context,
            //       builder: (context) => Dialog(
            //         child: ChangeNotifierProvider.value(
            //           value: provider,
            //           child: Consumer<NewsFeedVM>(
            //             builder: (context, value, child) {
            //               return NewsFeedWidget(
            //                 type: provider.items[index].type == "POST"
            //                     ? PostType.image
            //                     : PostType.poll,
            //                 horizontalPadding: 0,
            //                 controller: NewsFeedWidgetVm(
            //                   model: provider.items[index],
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            //   child: NewsFeedWidget(
            //     type: provider.items[index].isPost
            //         ? PostType.image
            //         : PostType.poll,
            //     controller: NewsFeedWidgetVm(
            //       model: provider.items[index],
            //     ),
            //   ),
            // );
            return listViewChild(controller.items[index]);
          },
          separatorBuilder: (context, index) {
            if (index == controller.items.length) {
              return SizedBox.shrink();
            }
            return (listSeparatorValue ?? 20).verticalSpace;
          },
          itemCount: controller.itemCount,
        ),
      ),
    );
  }
}
