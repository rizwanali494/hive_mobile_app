import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/home/widgets/bottom_nav_bar_widget.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
}
