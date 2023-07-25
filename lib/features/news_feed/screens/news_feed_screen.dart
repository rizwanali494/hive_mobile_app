import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/news_feed_widget.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/shimmers/shimmer_container.dart';

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
    return ShimmerContainer(withShadow: true);
    return DecoratedBox(
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
          Expanded(
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
                            type: index.isEven ? PostType.image : PostType.poll,
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
          ),
        ],
      ),
    );
  }
}
