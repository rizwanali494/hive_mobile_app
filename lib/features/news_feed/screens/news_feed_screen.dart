import 'package:flutter/material.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/base_listview_widget.dart';
import 'package:hive_mobile/app/view/widgets/news_feed_widget.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/shimmers/post_shimmer_widget.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_vm.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_widget_vm.dart';
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
          Consumer<NewsFeedVM>(
            builder: (BuildContext context, provider, Widget? child) {
             return BaseListViewWidget<AnnouncementPostModel>(
                controller: provider.listViewVM,
                emptyText: AppStrings.noDataFound,
                listViewChild: (item) => NewsFeedWidget(
                  type: item.isPost ? PostType.image : PostType.poll,
                  controller: NewsFeedWidgetVm(
                    model: item,
                  ),
                ),
                shimmerChild: PostShimmerWidget(type: PostType.image),
              );

            },
          ),
        ],
      ),
    );
  }
}
