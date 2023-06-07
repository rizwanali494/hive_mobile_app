import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_mobile/constants/svg_icons.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
import 'package:hive_mobile/res/app_strings.dart';
import 'package:hive_mobile/res/app_theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final icons = [
      SvgIcons.homeNav,
      SvgIcons.messageNav,
      SvgIcons.notificationNav,
      SvgIcons.reportNav,
      SvgIcons.profileNav,
    ];
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeScreenVm(),
      child: Consumer<HomeScreenVm>(
        builder: (context, provider, child) {
          return Scaffold(
            drawer: const Drawer(),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(47),
                  topLeft: Radius.circular(47),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(47.0),
                  topRight: Radius.circular(47.0),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.red,
                  backgroundColor: colors(context).white,
                  selectedIconTheme: IconThemeData(color: colors(context).red),
                  selectedItemColor: colors(context).black,
                  currentIndex: provider.currentIndex,
                  onTap: (index) {
                    provider.setIndex(index);
                  },
                  items: <BottomNavigationBarItem>[
                    for (var icon in icons)
                      BottomNavigationBarItem(
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Color(0xffCBEAF4),
                            ),
                            margin: const EdgeInsets.all(12),
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              icon,
                              color: colors(context).skyBlue,
                              // colorFilter: ColorFilter.mode(
                              //     colors(context).skyBlue, BlendMode.color),
                            ),
                          ),
                          label: ""),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              title: Text(
                AppStrings.newsFeed,
                style: colors(context).inter40w700,
              ),
            ),
            body: provider.currentPage,
          );
        },
      ),
    );
  }
}
