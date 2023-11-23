import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/screens/adding_external_grade_screen.dart';
import 'package:hive_mobile/features/external_grading/screens/document_name_widget.dart';
import 'package:hive_mobile/features/external_grading/screens/grade_detail_widget.dart';
import 'package:hive_mobile/features/external_grading/screens/grade_info_widget.dart';
import 'package:hive_mobile/features/external_grading/screens/subject_edit_dialog.dart';
import 'package:hive_mobile/features/external_grading/screens/subject_widget.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_info_vm.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class GradeDetailsScreen extends StatelessWidget {
  final ExternalGradeModel model;
  final Function(ExternalGradeModel? model) onChange;
  final Function(ExternalGradeModel? model) onDelete;
  static const route = "/GradeDetails";

  const GradeDetailsScreen(
      {Key? key,
      required this.model,
      required this.onChange,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 19.w,
        ),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => GradeDetailVM(model: model),
          child: Consumer<GradeDetailVM>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  DividerAppBar(
                    title: AppStrings.viewDetails,
                    titleStyle: styles.inter20w700,
                    actionButton: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: GestureDetector(
                        onTap: () async {
                          var model = await context.push<ExternalGradeModel>(
                            AddExternalGradeScreen.route,
                            extra: {
                              "editModel": provider.model,
                            },
                          );
                          onChange(model);
                        },
                        child: SvgPicture.asset(
                          SvgIcons.edit,
                          width: 25.w,
                          height: 25.h,
                          colorFilter:
                              ColorFilter.mode(styles.azure, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  26.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradeDetailWidget(
                            title: AppStrings.certificate,
                          ),
                          GradeDetailWidget(
                            title: AppStrings.institute,
                          ),
                          // GradeDetailWidget(
                          //   title: AppStrings.document,
                          // ),
                        ],
                      ),
                      40.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradeInfoDescription(
                              description: provider.certificate),
                          GradeInfoDescription(description: provider.institute),
                          Row(
                            children: [
                              GradeInfoDescription(
                                description: provider.documentName,
                              ),
                              // 12.horizontalSpace,
                              // Container(
                              //   padding: EdgeInsets.all(2),
                              //   decoration: BoxDecoration(
                              //     color: styles.yellowGreen,
                              //     shape: BoxShape.circle,
                              //   ),
                              //   child: Icon(
                              //     Icons.arrow_downward_sharp,
                              //     size: 20,
                              //     color: styles.white,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    height: 0.h,
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "${AppStrings.attachment}:",
                        style: styles.inter14w400,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            10.horizontalSpace,
                            if (provider.documents.length < 3) ...[
                              for (int i = 0;
                                  i < provider.documents.length;
                                  i++)
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: (i.isEven ? 10 : 0).w),
                                    child: DocumentNameWidget(
                                      name:
                                          provider.documents[i].documentName ??
                                              "$i",
                                      url: provider.documents[i].url ?? "",
                                    ),
                                  ),
                                ),
                            ],
                            // Expanded(
                            //   child: DocumentNameWidget(name: "1.pdf"),
                            // ),
                            // 10.horizontalSpace,
                            // Expanded(
                            //   child: DocumentNameWidget(name: "2.pdf"),
                            // ),
                          ],
                        ),
                      ),
                      10.horizontalSpace,
                      if (provider.documents.isNotEmpty) ...[
                        Text(
                          "${AppStrings.downloadAll}",
                          style: styles.inter14w400,
                        ),
                        5.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            provider.downloadAllDocuments();
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: styles.lightBlue,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_downward_sharp,
                              size: 20,
                              color: styles.denimBlue,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (provider.documents.length > 2) ...[
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          runSpacing: 10.h,
                          spacing: 10.w,
                          children: [
                            for (int index = 0;
                                index < provider.documents.length;
                                index++)
                              DocumentNameWidget(
                                name:
                                    "${provider.documents[index].documentName ?? "$index"}",
                                url: provider.documents[index].url ?? "",
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  Divider(
                    thickness: 0.5,
                    height: 50.h,
                  ),
                  if (provider.isDownloading)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )
                  else if (provider.subjectsVM.isNotEmpty) ...[
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
                        ),
                      ),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
