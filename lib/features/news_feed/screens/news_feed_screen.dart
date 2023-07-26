import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/news_feed_widget.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/shimmers/post_shimmer_widget.dart';
import 'package:hive_mobile/app/view/widgets/shimmers/shimmer_container.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_vm.dart';
import 'package:provider/provider.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return NewsFeedVM();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: styles.smokeWhite,
        ),
        child: Column(
          children: [
            AppBarWidget(
              color: styles.black,
              horizontalPadding: 12,
              title: AppStrings.newsFeed,
              titleStyle: styles.inter40w700,
            ),
            Consumer<NewsFeedVM>(
              builder: (BuildContext context, provider, Widget? child) {
                if (provider.isLoading) {
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                      itemBuilder: (context, index) {
                        return PostShimmerWidget(
                          type: PostType.image,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 20.verticalSpace;
                      },
                      itemCount: 7,
                    ),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                child: NewsFeedWidget(
                                  type: index.isEven
                                      ? PostType.image
                                      : PostType.poll,
                                  horizontalPadding: 0,
                                ),
                              ),
                            );
                          },
                          child: NewsFeedWidget(
                            type: index.isEven ? PostType.image : PostType.poll,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 20.verticalSpace;
                      },
                      itemCount: 12),
                );
              },
            ),

            // Expanded(
            //   child: ListView.separated(
            //       padding: EdgeInsets.symmetric(
            //         vertical: 12.h,
            //       ),
            //       itemBuilder: (context, index) {
            //         return GestureDetector(
            //           onTap: () {
            //             showDialog(
            //               context: context,
            //               builder: (context) => Dialog(
            //                 child: NewsFeedWidget(
            //                   type: index.isEven ? PostType.image : PostType.poll,
            //                   horizontalPadding: 0,
            //                 ),
            //               ),
            //             );
            //           },
            //           child: NewsFeedWidget(
            //             type: index.isEven ? PostType.image : PostType.poll,
            //           ),
            //         );
            //       },
            //       separatorBuilder: (context, index) {
            //         return 20.verticalSpace;
            //       },
            //       itemCount: 12),
            // )
          ],
        ),
      ),
    );
  }
}
