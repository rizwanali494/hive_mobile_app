import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/view_models/subject_vm.dart';

class GradeWidget extends StatelessWidget {
  final SubjectVM gradeVM;
  final Function() onEdit;

  const GradeWidget({
    super.key,
    required this.gradeVM,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.only(
        bottom: 1.h,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: styles.alabaster,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 21.w,
                    bottom: 12.h,
                    top: 12.h,
                  ),
                  child: Text(
                    gradeVM.name,
                    style: styles.inter12w400,
                  ),
                ),
              ),
            ),
            1.horizontalSpace,
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: styles.alabaster,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 14.w,
                      bottom: 12.h,
                      top: 12.h,
                    ),
                    child: Text(
                      gradeVM.grade,
                      style: styles.inter12w400,
                    ),
                  ),
                ),
              ),
            ),
            1.horizontalSpace,
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: styles.alabaster,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 14.w,
                      bottom: 12.h,
                      top: 12.h,
                    ),
                    child: Text(
                      gradeVM.gpa.toStringAsPrecision(3),
                      style: styles.inter12w400,
                    ),
                  ),
                ),
              ),
            ),
            1.horizontalSpace,
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 11.h,
                ),
                decoration: BoxDecoration(color: styles.alabaster),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 20.w,
                    ),
                    child: GestureDetector(
                      onTap: onEdit,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Edit",
                            style: styles.inter12w400,
                          ),
                          10.horizontalSpace,
                          SvgPicture.asset(
                            SvgIcons.edit,
                            width: 20.w,
                            height: 20.h,
                            colorFilter:
                                ColorFilter.mode(styles.azure, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
