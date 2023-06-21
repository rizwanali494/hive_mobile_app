import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/navigation/extensions.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/screens/document_upload_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/screens/title_text_field.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/view_models/application_info_vm.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/widgets/application_status_widget.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/divider_app_bar.dart';
import 'package:hive_mobile/features/university_application/screens/application_request/screens/university_selection_screen.dart';
import 'package:hive_mobile/features/university_application/screens/university_application_screen.dart';
import 'package:provider/provider.dart';

class ApplicationInfoScreen extends StatefulWidget {
  static const route = "/ApplicationInfo";

  const ApplicationInfoScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationInfoScreen> createState() => _ApplicationInfoScreenState();
}

class _ApplicationInfoScreenState extends State<ApplicationInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ApplicationInfoVM(),
      child: Consumer<ApplicationInfoVM>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: styles.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                    ),
                    child: DividerAppBar(
                      title: AppStrings.applicationInformation,
                    ),
                  ),
                  25.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(
                      left: 23.w,
                      right: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.selectStatus,
                          style: styles.inter14w600
                              .copyWith(color: styles.darkSlateGrey),
                        ),
                        13.verticalSpace,
                        Row(
                          children: [
                            ApplicationStatusToggleWidget(
                              title: AppStrings.applied,
                              onTap: () {
                                provider.selectStatus(AppStrings.applied);
                              },
                              iconPath: SvgIcons.applied,
                              isSelected:
                                  provider.iSelected(AppStrings.applied),
                            ),
                            10.horizontalSpace,
                            ApplicationStatusToggleWidget(
                              title: AppStrings.accepted,
                              iconPath: SvgIcons.tickSquare,
                              isSelected:
                                  provider.iSelected(AppStrings.accepted),
                              onTap: () {
                                provider.selectStatus(AppStrings.accepted);
                              },
                              spaceBetween: 7,
                            ),
                            10.horizontalSpace,
                            ApplicationStatusToggleWidget(
                              title: AppStrings.rejected,
                              iconPath: SvgIcons.undecided,
                              spaceBetween: 7,
                              onTap: () {
                                provider.selectStatus(AppStrings.rejected);
                              },
                              isSelected:
                                  provider.iSelected(AppStrings.rejected),
                            ),
                          ],
                        ),
                        34.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Text(
                            AppStrings.addDocument,
                            style: styles.inter14w600
                                .copyWith(color: styles.darkSlateGrey),
                          ),
                        ),
                        14.verticalSpace,
                        DocumentUploadWidget(),
                        28.verticalSpace,
                        TitleTextField(
                          title: AppStrings.sessionNote,
                          hintText: "",
                        ),
                        26.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TitleTextField(
                                title: AppStrings.scholarshipAmount,
                                hintText: "",
                              ),
                            ),
                            18.horizontalSpace,
                            Expanded(
                              child: TitleTextField(
                                title: AppStrings.scholarship,
                                hintText: "",
                              ),
                            ),
                          ],
                        ),
                        29.verticalSpace,
                        BlueElevatedButton(
                          text: AppStrings.add,
                          onTap: () {
                            context.popUntil(
                              HomeScreen.route,
                            );
                          },
                        )
                      ],
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
