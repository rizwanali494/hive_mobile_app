import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/view/dialogs/blue_elevated_button.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/screens/title_text_field.dart';
import 'package:hive_mobile/features/university_application/screens/application_info/widgets/application_status_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/app_strings.dart';
import '../../../../../app/resources/app_theme.dart';
import '../../application_request/screens/divider_app_bar.dart';
import '../view_models/application_info_vm.dart';

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
                            ApplicationStatusWidget(
                              title: AppStrings.applied,
                              onTap: () {
                                provider.selectStatus(AppStrings.applied);
                              },
                              iconPath: SvgIcons.applied,
                              isSelected: provider.iSelected(AppStrings.applied),
                            ),
                            10.horizontalSpace,
                            ApplicationStatusWidget(
                              title: AppStrings.accepted,
                              iconPath: SvgIcons.tickSquare,
                              isSelected: provider.iSelected(AppStrings.accepted),
                              onTap: () {
                                provider.selectStatus(AppStrings.accepted);
                              },
                              spaceBetween: 7,
                            ),
                            10.horizontalSpace,
                            ApplicationStatusWidget(
                              title: AppStrings.rejected,
                              iconPath: SvgIcons.undecided,
                              spaceBetween: 7,
                              onTap: () {
                                provider.selectStatus(AppStrings.rejected);
                              },
                              isSelected: provider.iSelected(AppStrings.rejected),
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                            horizontal: 19.w,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: styles.black.withOpacity(0.3))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  badges.Badge(
                                    badgeStyle: badges.BadgeStyle(
                                      badgeColor: styles.greyWhite,
                                    ),
                                    position:
                                        badges.BadgePosition.topEnd(end: -5),
                                    badgeContent: Icon(
                                      Icons.close,
                                      size: 10,
                                      color: styles.darkGrey,
                                    ),
                                    child: Container(
                                      width: 51.w,
                                      height: 51.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        color: styles.smokeWhite,
                                      ),
                                    ),
                                  ),
                                  11.horizontalSpace,
                                  Text(AppStrings.documentName)
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: styles.lightGrey,
                                    minimumSize: Size(0, 0),
                                    padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 25.w,
                                      vertical: 6.h,
                                    )),
                                child: Text(
                                  AppStrings.upload,
                                  style: styles.inter12w400.copyWith(
                                    color: styles.darkGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              child : TitleTextField(
                                title: AppStrings.scholarship,
                                hintText: "",
                              ),
                            ),
                          ],
                        ),
                        29.verticalSpace,
                        BlueElevatedButton(text: AppStrings.add)
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
