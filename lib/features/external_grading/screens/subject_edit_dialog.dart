import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/external_grading/view_models/subject_edit_vm.dart';
import 'package:hive_mobile/features/external_grading/view_models/subject_vm.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:provider/provider.dart';

class SubjectEditDialog extends StatelessWidget {
  final Function(SubjectVM value) onUpdate;
  final Function(SubjectVM value) onDelete;
  final SubjectVM subjectVM;

  const SubjectEditDialog(
      {super.key,
      required this.subjectVM,
      required this.onUpdate,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => SubjectEditVM(subjectVM: subjectVM),
      child: Consumer<SubjectEditVM>(
        builder: (context, provider, child) {
          return Dialog(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 34.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.edit,
                          style:
                              styles.inter16w600.copyWith(color: styles.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                            onDelete(this.subjectVM);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                                color: styles.lightPink,
                                borderRadius: BorderRadius.circular(36.r)),
                            child: Text(
                              AppStrings.delete,
                              style: styles.inter12w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  TitleTextField(
                    hintText: "",
                    title: AppStrings.subject,
                    controller: provider.subjectCtrl,
                  ),
                  16.verticalSpace,
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
                  15.verticalSpace,
                  TitleTextField(
                    hintText: AppStrings.gPA,
                    keyboardType: TextInputType.number,
                    controller: provider.gpaCtrl,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+.?[0-9]*'),
                      ),
                      FilteringTextInputFormatter.deny(
                        RegExp(r'\s'),
                      )
                    ],
                    title: AppStrings.gPA,
                  ),
                  21.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: BlueElevatedButton(
                      text: AppStrings.update,
                      onTap: () {
                        context.pop();
                        var enteredName = provider.subjectCtrl.text.trim();
                        final gpa =
                            double.tryParse(provider.gpaCtrl.text) ?? 0.0;
                        var name = enteredName.isEmpty
                            ? provider.subjectVM.name
                            : enteredName;
                        onUpdate(provider.subjectVM.copyWith(
                            grade: provider.selectedGrade ?? "",
                            name: name,
                            gpa: gpa));
                      },
                    ),
                  ),
                  50.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
