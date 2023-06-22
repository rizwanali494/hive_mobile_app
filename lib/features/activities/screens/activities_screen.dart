import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/activities/screens/activity_widget.dart';
import 'package:hive_mobile/features/home/screens/app_bar_widget.dart';

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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            child: AppBarWidget(
              color: styles.black,
              title: AppStrings.activities,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push("/ActivityDetailScreen");
                      },
                      child: ActivityWidget(
                        type: index.isEven ? PostType.image : PostType.poll,
                        selected: selected,
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
      ),
    );
  }
}
