import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/subject_vm.dart';
import 'package:hive_mobile/features/external_grading/view_models/subject_edit_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:provider/provider.dart';

class SubjectEditDialog extends StatelessWidget {
  final SubjectVM subjectVM;

  const SubjectEditDialog({super.key, required this.subjectVM});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => SubjectEditVM(subjectVM: subjectVM),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 34.w,
        ),
        child: Consumer<SubjectEditVM>(
          builder: (context, provider, child) {
            return MaterialApp(
              home: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  46.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.edit,
                        style: styles.inter16w600,
                      ),
                      Text(
                        AppStrings.edit,
                        style: styles.inter16w600,
                      ),
                    ],
                  ),
                  11.verticalSpace,
                  TitleTextField(
                    hintText: "",
                    controller: provider.subjectCtrl,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Text(
                      AppStrings.grade,
                      style: styles.inter14w600.copyWith(
                        color: styles.darkSlateGrey,
                      ),
                    ),
                  ),
                  11.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      border: Border.all(
                        color: styles.black.withOpacity(
                          0.2,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 19.w,
                      vertical: 10.h,
                    ),
                    child: DropdownButton<String>(
                      isDense: true,
                      value: provider.selectedGrade,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      dropdownColor: styles.white,
                      underline: const SizedBox(),
                      items: provider.grades
                          .map(
                            (value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: styles.inter12w400,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        provider.selectGrade(value ?? '');
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
