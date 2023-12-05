import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/screens/grade_details_screen.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_vm.dart';
import 'package:hive_mobile/features/external_grading/widgets/grading_title_widget.dart';
import 'package:provider/provider.dart';

class GradeInfoWidget extends StatelessWidget {
  final ExternalGradeModel model;

  final Function(ExternalGradeModel? model) onChange;

  const GradeInfoWidget({
    super.key,
    required this.onChange,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradingTitleWidget(
                title: model.certificate ?? "",
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 15.w,
                ),
                child: GestureDetector(
                  onTap: () async {
                    final provider = context.read<ExternalGradeVM>();
                    var model = await context.push<ExternalGradeModel>(
                        GradeDetailsScreen.route,
                        extra: {
                          "model": this.model,
                          "onChange": provider.updateItem,
                          "onDelete": provider.removeExternalGrade,
                        });
                    provider.removeExternalGrade(model);
                  },
                  child: Row(
                    children: [
                      GradingTitleWidget(
                        title: AppStrings.view,
                      ),
                      SizedBox(
                        width: 35.w,
                        height: 20.h,
                        child: SvgPicture.asset(SvgIcons.eye),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        5.verticalSpace,
        Divider(
          color: styles.black.withOpacity(.2),
        )
      ],
    );
  }
}
