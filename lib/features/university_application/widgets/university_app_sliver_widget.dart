import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/university_application/view_models/uni_app_sliver_vm.dart';
import 'package:hive_mobile/features/university_application/view_models/university_app_widget_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/show_more_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/university_app_shimmer_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/university_application_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

class UniversityAppSliver extends StatelessWidget {
  final UniAppSliverVM controller;

  const UniversityAppSliver({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Text(
            controller.title,
            style: styles.inter20w700,
          ),
        ),
        SliverToBoxAdapter(child: 20.verticalSpace),
        if (controller.isLoading)
          SliverToBoxAdapter(
            child: UniversityAppShimmer(),
          )
        else if (controller.applications.isEmpty)
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                "No Application Found",
                style: styles.inter12w400Italic,
              ),
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => UniversityApplicationWidget(
                      controller: UniversityAppWidgetVM(
                        model: controller.applications[index],
                        onUpdate: controller.onUpdate,
                      ),
                    ),
                childCount: controller.applications.length),
          ),
        if (!controller.isLoading && controller.applications.isNotEmpty)
          ShowMoreButton(
            styles: styles,
            hasAll: controller.hasAll,
            onTap: () {
              controller.onTap();
            },
            isLoading: controller.isGettingMore,
          ),
        SliverToBoxAdapter(child: 20.verticalSpace),
      ],
    );
  }
}
