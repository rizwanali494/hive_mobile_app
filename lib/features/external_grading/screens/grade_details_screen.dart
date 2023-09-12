import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/external_grading/screens/adding_external_grade_screen.dart';
import 'package:hive_mobile/features/external_grading/screens/gradeInfoWidget.dart';
import 'package:hive_mobile/features/external_grading/screens/grade_detail_widget.dart';
import 'package:hive_mobile/features/external_grading/screens/subject_edit_dialog.dart';
import 'package:hive_mobile/features/external_grading/screens/subject_widget.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_info_vm.dart';
import 'package:hive_mobile/features/university_application/screens/divider_app_bar.dart';
import 'package:provider/provider.dart';

class GradeDetailsScreen extends StatelessWidget {
  final ExternalGradeModel model;
  static const route = "/GradeDetails";

  const GradeDetailsScreen({Key? key, required this.model}) : super(key: key);

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
                        onTap: () {
                          context.push(
                            AddExternalGradeScreen.route,
                            extra: {
                              "editModel": provider.model,
                            },
                          );
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
                            title: AppStrings.degree,
                          ),
                          GradeDetailWidget(
                            title: AppStrings.institute,
                          ),
                          GradeDetailWidget(
                            title: AppStrings.document,
                          ),
                        ],
                      ),
                      40.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradeInfoDescription(description: provider.degree),
                          GradeInfoDescription(description: provider.institute),
                          Row(
                            children: [
                              GradeInfoDescription(
                                description: provider.documentName,
                              ),
                              12.horizontalSpace,
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: styles.yellowGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_downward_sharp,
                                  size: 20,
                                  color: styles.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  21.verticalSpace,
                  if (provider.gettingSubject)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )
                  else if (provider.subjectsVM.isNotEmpty) ...[
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

                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: ApplicationStatusWidget(
                  //     color: styles.lightPink,
                  //     title: AppStrings.delete,
                  //     iconPath: SvgIcons.undecided,
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
