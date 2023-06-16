import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_adding_vm.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/screens/document_upload_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/screens/title_text_field.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class AddExternalGradeScreen extends StatelessWidget {
  static const route = "/AddExternalGrade";

  const AddExternalGradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => GradeAddingVM(),
      child: Consumer<GradeAddingVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 19.w,
              ),
              child: Column(
                children: [
                  DividerAppBar(
                    title: AppStrings.addExternalGrade,
                    titleStyle: styles.inter20w700,
                  ),
                  26.verticalSpace,
                  TitleTextField(
                    title: AppStrings.degree,
                    hintText: "",
                  ),
                  20.verticalSpace,
                  TitleTextField(
                    title: AppStrings.institute,
                    hintText: "",
                  ),
                  23.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TitleTextField(
                          title: AppStrings.subjects,
                          hintText: "",
                        ),
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              ),
                              child: DropdownButton<String>(
                                value: provider.selectedGrade,
                                isExpanded: true,
                                icon:
                                    const Icon(Icons.keyboard_arrow_down_sharp),
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
                                  provider.setGrade(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  27.verticalSpace,
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 30.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.r),
                          border: Border.all(
                            color: styles.skyBlue,
                          )),
                      child: Text(
                        "+ ${AppStrings.add} ${AppStrings.subjects}",
                        style: styles.inter12w400.copyWith(
                          color: styles.skyBlue,
                        ),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          AppStrings.uploadResult,
                          style: styles.inter14w600,
                        ),
                      ),
                      14.verticalSpace,
                      DocumentUploadWidget(),
                    ],
                  ),
                  24.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: styles.skyBlue,
                      ),
                      child: Text(
                        AppStrings.add,
                        style: styles.inter12w400.copyWith(
                          color: styles.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
