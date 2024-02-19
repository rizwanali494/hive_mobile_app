import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
  final GradeAddingVM? controller;

  const AddExternalGradeScreen(
      {Key? key, this.addedGrades = const [], this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider.value(
      value: controller,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 19.w,
          ),
          child: Consumer<GradeAddingVM>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DividerAppBar(
                    title: titleText(),
                    titleStyle: styles.inter20w700,
                    actionButton: provider.editModel == null
                        ? null
                        : GestureDetector(
                            onTap: () {
                              context.pop();
                              context.pop(provider.editModel);
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
                  ),
                  26.verticalSpace,
                  if (provider.isObjectLoading)
                    Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (provider.hasObjectError)
                    Expanded(
                      child: Center(
                        child: Text(AppStrings.somethingWentWrong),
                      ),
                    )
                  else
                    Expanded(
                      child: SingleChildScrollView(
                        controller: provider.scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.certificate,
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
                                value: provider.selectedCertificate,
                                isDense: true,
                                icon:
                                    const Icon(Icons.keyboard_arrow_down_sharp),
                                dropdownColor: styles.white,
                                underline: const SizedBox(),
                                items: provider.certificates
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
                                        provider.selectCertificate(value);
                                      }
                                    : null,
                              ),
                            ),
                            20.verticalSpace,
                            Form(
                              key: provider.form,
                              child: TitleTextField(
                                title: AppStrings.institute,
                                validator: provider.instituteValidator,
                                controller: provider.institute,
                                maxLength: 50,
                                hintText: "",
                              ),
                            ),
                            23.verticalSpace,
                            Form(
                              key: provider.subjectFormKey,
                              child: SizedBox(
                                width: double.infinity,
                                child: TitleTextField(
                                  title: AppStrings.subject,
                                  validator: provider.subjectAddingValidation,
                                  maxLength: 50,
                                  errorStyle: styles.inter9w400
                                      .copyWith(color: styles.red),
                                  buildCounter: (p0,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) {
                                    return Text(
                                      "${currentLength}/${maxLength}",
                                      style: styles.inter9w400,
                                    );
                                  },
                                  controller: provider.subjectCtrl,
                                  hintText: "",
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                (value) =>
                                                    DropdownMenuItem<String>(
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
                                8.horizontalSpace,
                                Expanded(
                                  child: Form(
                                    key: provider.gpaFormKey,
                                    child: TitleTextField(
                                      title: AppStrings.gPA,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'^[0-9]+.?[0-9]*'),
                                        ),
                                        FilteringTextInputFormatter.deny(
                                          RegExp(r'\s'),
                                        )
                                      ],
                                      validator: provider.gpaAddingValidation,
                                      maxLength: 5,
                                      errorStyle: styles.inter9w400
                                          .copyWith(color: styles.red),
                                      buildCounter: (p0,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) {
                                        return Text(
                                          "${currentLength}/${maxLength}",
                                          style: styles.inter9w400,
                                        );
                                      },
                                      controller: provider.gpa,
                                      hintText: "",
                                    ),
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
                                    "+ ${buttonText()} ${AppStrings.subjects}",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppStrings.subjects,
                                            style: styles.inter10w600
                                                .copyWith(color: styles.white),
                                          ),
                                          40.horizontalSpace,
                                          Text(
                                            AppStrings.grade,
                                            style: styles.inter10w600
                                                .copyWith(color: styles.white),
                                          ),
                                          54.horizontalSpace,
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              AppStrings.gPA,
                                              style: styles.inter10w600
                                                  .copyWith(
                                                      color: styles.white),
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
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
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
                                14.verticalSpace,
                                if (provider.fileDownloading)
                                  Center(
                                    child: CircularProgressIndicator(),
                                  )
                                else if (provider.errorDownloading)
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppStrings.errorDocDownloading,
                                          style: styles.inter12w500,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              provider.retry();
                                            },
                                            child: Text(
                                              AppStrings.retry,
                                              style: styles.inter12w400Italic,
                                            )),
                                      ],
                                    ),
                                  )
                                else ...[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 4.w),
                                        child: Text(
                                          AppStrings.addDocument,
                                          style: styles.inter14w600.copyWith(
                                              color: styles.darkSlateGrey),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          provider.selectDocuments(context);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: styles.skyBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  24.verticalSpace,
                                  for (final doc in provider.documents)
                                    DocumentUploadWidget(
                                      controller: doc,
                                    ),
                                ],
                              ],
                            ),
                            24.verticalSpace,
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (provider.documents.isEmpty ||
                                        provider.subjectsVM.isEmpty)
                                    ? null
                                    : () {
                                        // context.pop();
                                        provider.addUpdate(context);
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: styles.skyBlue,
                                ),
                                child: Text(
                                  buttonText(),
                                  style: styles.inter12w400.copyWith(
                                    color: styles.white,
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String buttonText() {
    if (controller?.editModel == null) {
      return AppStrings.add;
    }
    return AppStrings.update;
  }

  String titleText() {
    if (controller?.editModel == null) {
      return AppStrings.addExternalGrade;
    }
    return AppStrings.editExternalGrade;
  }
}
