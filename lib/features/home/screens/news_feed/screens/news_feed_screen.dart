import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/widgets/news_feed_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/app_theme.dart';
import '../../../view_models/home_screen_vm.dart';
import '../../app_bar_widget.dart';

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
    final provider = context.read<HomeScreenVm>();

    return Column(
      children: [
        AppBarWidget(
          color: styles.black,
          title: AppStrings.newsFeed,
          titleStyle: styles.inter40w700,
          onMenuTap: () {
            provider.openDrawer();
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(),
            child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: NewsFeedWidget(
                              type: index.isEven
                                  ? PostType.image
                                  : PostType.poll),
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
        ),
      ],
    );
  }
}
