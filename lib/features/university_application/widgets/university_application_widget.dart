import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/university_application/university_application_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';
import 'package:hive_mobile/app/view_models/default_status_controller.dart';
import 'package:hive_mobile/features/university_application/screens/university_app_request_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/uni_app_status_controller.dart';
import 'package:hive_mobile/features/university_application/view_models/university_app_widget_vm.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';

import 'package:hive_mobile/features/university_application/widgets/application_status_widget.dart';

class UniversityApplicationWidget extends StatelessWidget {
  final UniversityAppWidgetVM controller;

  const UniversityApplicationWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () async {
                    // final provider =
                    //     context.read<UniversityApplicationScreenVM>();
                    var model = await context
                        .push(UniversitySelectionScreen.route, extra: {
                      "model": controller.model,
                    });
                    if (model is UniversityApplicationModel) {
                      controller.onUpdate(model);
                    }
                    // UniversityApplicationModel? updatedModel =
                    //     model as UniversityApplicationModel?;
                    // provider.updateUniversityModel(model,
                    //     isPrevious: updatedModel?.getStatus ==
                    //         ApplicationStatus.unapproved);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.universityName,
                        style: styles.inter14w600.copyWith(
                          color: styles.darkSlateGrey,
                        ),
                      ),
                      Text(
                        controller.description,
                        style: styles.inter10w400.copyWith(
                          color: styles.darkGrey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    context.push(DescriptionScreen.route, extra: {
                      "title": AppStrings.comment,
                      "description": controller.model.comments
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.comment,
                        style: styles.inter14w600.copyWith(
                          color: styles.darkSlateGrey,
                        ),
                      ),
                      SvgPicture.asset(SvgIcons.eye)
                    ],
                  ),
                ),
              ),
            ),
            ApplicationStatusWidget(
              applicationStatus: controller.applicationState,
              controller: UApplicationStatusController(
                styles: styles,
                application: controller.model,
              ),
            ),
          ],
        ),
        5.verticalSpace,
        Divider(
          color: styles.black.withOpacity(0.2),
        ),
        18.verticalSpace,
      ],
    );
  }
}
