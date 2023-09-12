import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/screens/subject_edit_dialog.dart';
import 'package:hive_mobile/features/external_grading/screens/subject_widget.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_adding_vm.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/widgets/document_upload_widget.dart';
import 'package:hive_mobile/features/university_application/widgets/title_text_field.dart';
import 'package:provider/provider.dart';

class AddExternalGradeScreen extends StatelessWidget {
  static const route = "/AddExternalGrade";
  final List<String> addedGrades;
  final ExternalGradeModel? editModel;

  const AddExternalGradeScreen(
      {Key? key, this.addedGrades = const [], this.editModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          GradeAddingVM(degrees: addedGrades, editModel: editModel),
      child: Consumer<GradeAddingVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 19.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DividerAppBar(
                      title: AppStrings.addExternalGrade,
                      titleStyle: styles.inter20w700,
                    ),
                    26.verticalSpace,
                    Text(
                      AppStrings.degree,
                      style: styles.inter14w600.copyWith(
                        color: styles.darkSlateGrey,
                      ),
                    ),
                    11.verticalSpace,
                    Container(
                      margin: EdgeInsets.only(
                        right: 10.w,
                      ),
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
                        isExpanded: true,
                        value: provider.selectedDegree,
                        isDense: true,
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        dropdownColor: styles.white,
                        underline: const SizedBox(),
                        items: provider.degrees
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: styles.inter12w400,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: provider.editModel == null
                            ? (value) {
                                provider.selectDegree(value);
                              }
                            : null,
                      ),
                    ),
                    20.verticalSpace,
                    TitleTextField(
                      title: AppStrings.institute,
                      controller: provider.institute,
                      hintText: "",
                    ),
                    23.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TitleTextField(
                            title: AppStrings.subjects,
                            controller: provider.subjectCtrl,
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
                                  vertical: 10.h,
                                ),
                                child: DropdownButton<String>(
                                  value: provider.selectedGrade,
                                  isDense: true,
                                  isExpanded: true,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp),
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
                      child: GestureDetector(
                        onTap: () {
                          provider.addSubject();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 30.w),
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
                    ),
                    26.verticalSpace,
                    if (provider.subjectsVM.isNotEmpty) ...[
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 9.h,
                            ),
                            decoration: BoxDecoration(
                                color: styles.azure,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                )),
                            child: Padding(
                              padding: EdgeInsets.only(left: 21.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      AppStrings.subjects,
                                      style: styles.inter10w600
                                          .copyWith(color: styles.white),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      AppStrings.grade,
                                      style: styles.inter10w600
                                          .copyWith(color: styles.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (var subject in provider.subjectsVM)
                        GradeWidget(
                          gradeVM: subject,
                          onEdit: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            showDialog(
                              context: context,
                              builder: (context) => SubjectEditDialog(
                                subjectVM: subject,
                                onUpdate: provider.updateVM,
                                onDelete: provider.removeSubject,
                              ),
                            );
                          },
                        ),
                      33.verticalSpace,
                    ],
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
                        DocumentUploadWidget(
                          onTap: provider.pickFile,
                          onRemove: provider.removeFile,
                          documentName: provider.documentName,
                          isDownloading: provider.fileDownloading,
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // context.pop();
                          provider.uploadExternalGrade(context);
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
            ),
          );
        },
      ),
    );
  }
}
