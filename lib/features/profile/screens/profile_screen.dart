import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/models/ui_state_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/user_placeholder_widget.dart';
import 'package:hive_mobile/features/profile/models/user_profile_model.dart';
import 'package:hive_mobile/features/profile/screens/account_setting_screen.dart';
import 'package:hive_mobile/features/profile/view_models/accepted_application_vm.dart';
import 'package:hive_mobile/features/profile/view_models/profile_screen_vm.dart';
import 'package:hive_mobile/features/profile/view_models/user_awards_vm.dart';
import 'package:hive_mobile/features/profile/widgets/basic_info_widget.dart';
import 'package:hive_mobile/features/profile/widgets/profile_section_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Consumer<ProfileScreenVM>(
      builder: (context, controller, child) {
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
                        child: SvgPicture.asset(SvgIcons.edit),
                      ),
                    ],
                  ),
                  27.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 27.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: controller.userImage,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 90.h,
                            height: 90.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => UserPlaceHolderWidget(
                            width: 90.w,
                            height: 90.h,
                          ),
                          errorWidget: (context, url, error) =>
                              UserPlaceHolderWidget(
                            width: 90.w,
                            height: 90.h,
                          ),
                        ),
                        // CircleAvatar(
                        //   backgroundImage: NetworkImage(
                        //     _user.imageUrl,
                        //   ),
                        //   radius: 50,
                        // ),
                        21.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.userName,
                                style: styles.inter20w600
                                    .copyWith(color: styles.white),
                              ),
                              8.verticalSpace,
                              if (controller.userBio.isNotEmpty)
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
                                    controller.userBio,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BasicInfoWidget(
                            title: AppStrings.gender,
                            iconPath: SvgIcons.profile,
                            info: controller.gender,
                          ),
                          30.horizontalSpace,
                          BasicInfoWidget(
                            title: AppStrings.birthDate,
                            iconPath: SvgIcons.cake,
                            info: controller.dateOfBirth,
                          ),
                        ],
                      ),
                      15.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 0.w,
                        ),
                        child: BasicInfoWidget(
                          title: AppStrings.campus,
                          iconPath: SvgIcons.building,
                          info: controller.branchName,
                        ),
                      ),
                      10.verticalSpace,
                      Divider(
                        color: styles.black.withOpacity(0.2),
                      ),
                      15.verticalSpace,
                      ProfileSectionWidget(
                        wrapChildren: controller.userModel.accountData?.hobbies
                                ?.map((e) => e.name ?? "")
                                .toList() ??
                            [],
                        uiState: UiState.hasAll(),
                        heading: AppStrings.hobbies,
                      ),
                      17.verticalSpace,
                      ProfileSectionWidget(
                        wrapChildren: controller.userModel.accountData?.hobbies
                                ?.map((e) => e.name ?? "")
                                .toList() ??
                            [],
                        uiState: UiState.hasAll(),
                        heading: AppStrings.subjects,
                      ),
                      17.verticalSpace,
                      ChangeNotifierProvider<UserAcceptedApplicationVM>(
                        create: (BuildContext context) =>
                            UserAcceptedApplicationVM(),
                        child: Consumer<UserAcceptedApplicationVM>(
                          builder: (context, provider, child) {
                            return ProfileSectionWidget(
                              wrapChildren: provider.items,
                              // onTap: provider.fetchNextItems,
                              heading: AppStrings.acceptedUniversities,
                              uiState: provider.uiState,
                            );
                          },
                        ),
                      ),
                      17.verticalSpace,
                      ChangeNotifierProvider<UserAwardsVM>(
                        create: (BuildContext context) => UserAwardsVM(),
                        child: Consumer<UserAwardsVM>(
                          builder: (context, provider, child) {
                            return ProfileSectionWidget(
                              // wrapChildren: _user.achievementsAwards,
                              wrapChildren: provider.items,
                              icon: SvgPicture.asset(SvgIcons.star),
                              heading: AppStrings.achievementsAwards,
                              onTap: provider.fetchNextItems,
                              uiState: provider.uiState,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// const _user = UserProfileModel.user;
