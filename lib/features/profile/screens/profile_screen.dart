import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/features/profile/models/user_profile_model.dart';
import 'package:hive_mobile/features/profile/screens/account_setting_screen.dart';
import 'package:hive_mobile/features/profile/widgets/basic_info_widget.dart';
import 'package:hive_mobile/features/profile/widgets/profile_section_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                styles.linearBlueGradientTopLeft,
                styles.linearBlueGradientBottomRight,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                color: styles.white,
                horizontalPadding: 19,
                title: AppStrings.profile,
                actions: [
                  GestureDetector(
                      onTap: () {
                        context.push(AccountSettingScreen.route);
                      },
                      child: SvgPicture.asset(SvgIcons.edit)),
                ],
              ),
              27.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 27.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        _user.imageUrl,
                      ),
                      radius: 50,
                    ),
                    21.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _user.name,
                            style: styles.inter20w600
                                .copyWith(color: styles.white),
                          ),
                          8.verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: styles.white.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(
                                15.r,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 9.w, vertical: 10.h),
                            child: Text(
                              _user.description,
                              style: styles.inter12w400
                                  .copyWith(color: styles.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              35.verticalSpace,
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  18.verticalSpace,
                  Text(
                    AppStrings.basicInfo,
                    style: styles.inter16w600,
                  ),
                  13.verticalSpace,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BasicInfoWidget(
                        title: AppStrings.gender,
                        iconPath: SvgIcons.profile,
                        info: _user.gender,
                      ),
                      30.horizontalSpace,
                      BasicInfoWidget(
                        title: AppStrings.birthDate,
                        iconPath: SvgIcons.cake,
                        info: _user.birthDate,
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  BasicInfoWidget(
                    title: AppStrings.campus,
                    iconPath: SvgIcons.building,
                    info: _user.campusName,
                  ),
                  10.verticalSpace,
                  Divider(
                    color: styles.black.withOpacity(0.2),
                  ),
                  15.verticalSpace,
                  ProfileSectionWidget(
                    wrapChildren: _user.hobbies,
                    heading: AppStrings.hobbies,
                  ),
                  17.verticalSpace,
                  ProfileSectionWidget(
                    wrapChildren: _user.subjects,
                    heading: AppStrings.subjects,
                  ),
                  17.verticalSpace,
                  ProfileSectionWidget(
                    wrapChildren: _user.acceptedUniversities,
                    heading: AppStrings.acceptedUniversities,
                  ),
                  17.verticalSpace,
                  ProfileSectionWidget(
                    wrapChildren: _user.achievementsAwards,
                    icon: SvgPicture.asset(SvgIcons.star),
                    heading: AppStrings.achievementsAwards,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const _user = UserProfileModel.user;
