import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/models/data/activity_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/base_listview_widget.dart';
import 'package:hive_mobile/app/view/widgets/shimmers/post_shimmer_widget.dart';
import 'package:hive_mobile/features/activities/screens/activity_details_screen.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_object_vn.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/activities/widgets/activity_widget.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

class ActivitiesScreen extends StatelessWidget {
  static const route = '/ActivitiesScreen';

  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    var selected = "1";

    return DecoratedBox(
      decoration: BoxDecoration(
        color: styles.smokeWhite,
      ),
      child: Consumer<ActivityScreenVM>(
        builder: (context, provider, child) {
          return Column(
            children: [
              AppBarWidget(
                color: styles.black,
                horizontalPadding: 12,
                title: AppStrings.activities,
              ),
              BaseListViewWidget<ActivityModel>(
                controller: provider.listViewVM,
                listViewChild: (item) => GestureDetector(
                  onTap: () {
                    context.push(
                      ActivityDetailScreen.route,
                      extra: {
                        "controller": ActivityDetailObjectVM(
                          item,
                        ),
                        "activityController": provider,
                      },
                    );
                  },
                  child: ActivityWidget(
                    type: 1.isEven ? PostType.image : PostType.poll,
                    selected: selected,
                    controller: ActivityDetailObjectVM(
                      item,
                    ),
                  ),
                ),
                shimmerChild: PostShimmerWidget(type: PostType.image),
              ),
            ],
          );
        },
      ),
    );
  }

  Divider buildDivider() => Divider(color: Colors.black.withOpacity(0.2));
}
