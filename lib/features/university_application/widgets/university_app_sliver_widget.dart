import 'package:flutter/material.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/university_application/view_models/university_app_widget_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/university_app_shimmer_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/university_application_widget.dart';

class UniversityAppSliver extends StatelessWidget {
  final bool isLoading;
  final List<UniversityApplicationModel> applications;

  const UniversityAppSliver(
      {super.key, required this.isLoading, required this.applications});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    if (isLoading) {
      return SliverToBoxAdapter(
        child: UniversityAppShimmer(),
      );
    }
    if (applications.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            "No Application Found",
            style: styles.inter12w400Italic,
          ),
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => UniversityApplicationWidget(
                  controller: UniversityAppWidgetVM(model: applications[index]),
                ),
            childCount: applications.length),
      );
    }
  }
}
