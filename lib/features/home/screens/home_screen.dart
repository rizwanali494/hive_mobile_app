import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/home/widgets/drawer_action_widget.dart';
import 'package:hive_mobile/features/home/screens/news_feed/models/mock_news_feed_model.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
import 'package:hive_mobile/features/home/widgets/bottom_nav_bar_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final icons = [
    SvgIcons.activities,
    SvgIcons.calender,
    SvgIcons.myServices,
    SvgIcons.clock,
    SvgIcons.externalGrading,
    SvgIcons.universityApplication,
  ];

  final actionNames = [
    AppStrings.activities,
    AppStrings.calendar,
    AppStrings.myServices,
    AppStrings.sessionNote,
    AppStrings.externalGrading,
    AppStrings.universityApplication,
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeScreenVm(),
      child: Consumer<HomeScreenVm>(
        builder: (context, provider, child) {
          return Scaffold(
            drawer: Drawer(
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
                          appTheme(context).linearBlueGradientTopLeft,
                          appTheme(context).linearBlueGradientBottomRight,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: bottomRadius,
                        bottomRight: bottomRadius,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(_user.userAvatar),
                        ),
                        12.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _user.name,
                              style: appTheme(context).inter16w600.copyWith(
                                    color: appTheme(context).white,
                                  ),
                            ),
                            Text(
                              AppStrings.clickToView,
                              style: appTheme(context).inter12w400Underline,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset(SvgIcons.arrowRight),
                          ),
                        ),
                      ],
                    ),
                  ),
                  41.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(
                      left: 36.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          icons.length,
                          (index) => DrawerActionWidget(
                            icon: icons[index],
                            actionName: actionNames[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
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
                              color: appTheme(context).black.withOpacity(0.2),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                SvgPicture.asset(SvgIcons.logout),
                                20.horizontalSpace,
                                Text(
                                  AppStrings.logout,
                                  style: appTheme(context).inter15w400,
                                ),
                              ],
                            ),
                            50.verticalSpace

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(47),
                  topLeft: Radius.circular(47),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(47.0),
                  topRight: Radius.circular(47.0),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: appTheme(context).white,
                  currentIndex: provider.currentIndex,
                  onTap: (index) {
                    provider.setIndex(index);
                  },
                  items: <BottomNavigationBarItem>[
                    for (var icon in provider.icons)
                      BottomNavigationBarItem(
                        icon: BottomNavBarWidget(
                          icon: icon,
                          isSelected: provider.isSelected(icon),
                        ),
                        label: "",
                      ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              title: Text(
                AppStrings.newsFeed,
                style: appTheme(context).inter40w700,
              ),
            ),
            body: provider.currentPage,
          );
        },
      ),
    );
  }

  final bottomRadius = const Radius.circular(40);
}

const _user = MockNewsFeedModel.user;
