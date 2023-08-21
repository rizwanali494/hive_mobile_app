import 'package:flutter/material.dart';
import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/features/university_application/widgets/university_app_shimmer_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/university_application_widget.dart';

class UniversityAppSliver extends StatelessWidget {
  final isLoading;
  final List<UniversityApplicationModel> list;

  const UniversityAppSliver({super.key, this.isLoading, required this.list});

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
              title: list[index].description ?? "",
                  applicationStatus: index.isEven
                      ? ApplicationState.accepted
                      : ApplicationState.applied,
                ),
            childCount: list.length),
      );
    }
  }
}
