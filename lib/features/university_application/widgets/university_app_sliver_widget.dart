import 'package:flutter/material.dart';
import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
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
    if (isLoading) {
      return SliverToBoxAdapter(
        child: UniversityAppShimmer(),
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
