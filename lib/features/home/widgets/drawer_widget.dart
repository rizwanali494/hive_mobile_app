import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/user_placeholder_widget.dart';
import 'package:hive_mobile/features/home/view_models/drawer_widget_vm.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
import 'package:hive_mobile/features/home/widgets/drawer_action_widget.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.bottomRadius,
    required this.controller,
  });

  final Radius bottomRadius;
  final DrawerWidgetVM controller;

  @override
  Widget build(BuildContext context) {
    final homeScreenVM = context.read<HomeScreenVm>();
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: (83 + MediaQuery.of(context).padding.top).h,
              bottom: 30.h,
              left: 19.h,
              right: 36.h,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  styles.linearBlueGradientTopLeft,
                  styles.linearBlueGradientBottomRight,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: bottomRadius,
                bottomRight: bottomRadius,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                homeScreenVM.setBottomNavWidget(4, context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (controller.userImage == null)
                    Container(
                      width: 45.h,
                      height: 45.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: UserPlaceHolderWidget(),
                    )
                  else
                    CachedNetworkImage(
                      imageUrl: controller.userImage ?? "",
                      imageBuilder: (context, imageProvider) => Container(
                        width: 45.h,
                        height: 45.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const UserPlaceHolderWidget(),
                      errorWidget: (context, url, error) =>
                          const UserPlaceHolderWidget(),
                    ),
                  // CircleAvatar(
                  //   radius: 25,
                  //   backgroundImage: NetworkImage(_user.userAvatar),
                  // ),
                  12.horizontalSpace,
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: styles.inter16w600.copyWith(
                            color: styles.white,
                          ),
                        ),
                        Text(
                          AppStrings.clickToView,
                          style: styles.inter12w400Underline.copyWith(
                            color: styles.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(SvgIcons.arrowRight),
                  ),
                ],
              ),
            ),
          ),
          // 41.verticalSpace,
          Expanded(
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 36.h,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      41.verticalSpace,
                      ...List.generate(
                        homeScreenVM.drawerIcons.length,
                        (index) => GestureDetector(
                          onTap: () {
                            homeScreenVM.setDrawerWidget(index);
                          },
                          child: DrawerActionWidget(
                            icon: homeScreenVM.drawerIcons[index],
                            actionName: homeScreenVM.drawerActionNames[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: styles.black.withOpacity(0.2),
                  ),
                  10.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      homeScreenVM.logout();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(SvgIcons.logout),
                        20.horizontalSpace,
                        Text(
                          AppStrings.logout,
                          style: styles.inter15w400,
                        ),
                      ],
                    ),
                  ),
                  50.verticalSpace
                ],
              ),
            ),
          ),
          // ColoredBox(
          //   color: styles.deepSkyBlue,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 30.w,
          //     ),
          //     child: Align(
          //       alignment: Alignment.bottomCenter,
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           20.verticalSpace,
          //           GestureDetector(
          //             onTap: () {
          //               homeScreenVM.logout();
          //             },
          //             child: Row(
          //               children: [
          //                 SvgPicture.asset(
          //                   SvgIcons.logout,
          //                   color: styles.white,
          //                 ),
          //                 20.horizontalSpace,
          //                 Text(
          //                   AppStrings.logout,
          //                   style: styles.inter15w400
          //                       .copyWith(color: styles.white),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           50.verticalSpace
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
