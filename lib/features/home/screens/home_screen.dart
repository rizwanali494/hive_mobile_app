import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/app/constants/svg_icons.dart';
import 'package:hive_mobile/app/navigation/extensions.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/backup_email_dialog.dart';
import 'package:hive_mobile/features/authentication/screens/sign_in_screen.dart';
import 'package:hive_mobile/features/news_feed/models/mock_news_feed_model.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
import 'package:hive_mobile/features/home/widgets/bottom_nav_bar_widget.dart';
import 'package:hive_mobile/features/home/widgets/drawer_action_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
        context: context,
        builder: (context) => const BackUpEmailDialog(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeScreenVm(),
      child: Consumer<HomeScreenVm>(
        builder: (providerContext, provider, child) {
          return Scaffold(
            key: provider.scaffoldKey,
            backgroundColor: styles.white,
            // extendBody: true,
            drawer: Drawer(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.75,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: (83 + MediaQuery
                          .of(context)
                          .padding
                          .top).h,
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
                      onTap: (){
                        provider.setBottomNavWidget(4, context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(_user.userAvatar),
                          ),
                          12.horizontalSpace,
                          Expanded(

                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _user.name,
                                  style: styles.inter16w600.copyWith(
                                    color: styles.white,
                                  ),
                                ),
                                Text(
                                  AppStrings.clickToView,
                                  style: styles.inter12w400Underline
                                      .copyWith(color: styles.white),
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
                  41.verticalSpace,
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 36.h,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              provider.drawerIcons.length,
                                  (index) =>
                                  GestureDetector(
                                    onTap: () {
                                      provider.setDrawerWidget(index);
                                    },
                                    child: DrawerActionWidget(
                                      icon: provider.drawerIcons[index],
                                      actionName: provider
                                          .drawerActionNames[index],
                                    ),
                                  ),
                            ),
                          ],
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
                              context.pushAndRemoveUntil(
                                  SignInScreen.route
                              );
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
                ],
              ),
            ),
            body: provider.currentPage,
            bottomNavigationBar: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
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
                  backgroundColor: styles.white,
                  currentIndex: provider.currentIndex,
                  onTap: (index) {
                    provider.setBottomNavWidget(index, context);
                  },
                  items: <BottomNavigationBarItem>[
                    for (var icon in provider.btmNavIcons)
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
          );
        },
      ),
    );
  }

  final bottomRadius = const Radius.circular(40);
}

const _user = MockNewsFeedModel.user;
