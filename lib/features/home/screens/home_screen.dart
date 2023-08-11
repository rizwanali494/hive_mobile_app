import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/dialogs/backup_email_dialog.dart';
import 'package:hive_mobile/features/home/view_models/drawer_widget_vm.dart';
import 'package:hive_mobile/features/home/widgets/drawer_widget.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
import 'package:hive_mobile/features/home/widgets/bottom_nav_bar_widget.dart';
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
            drawer: DrawerWidget(
              bottomRadius: bottomRadius,
              controller: DrawerWidgetVM(
                userModel: provider.getUserModel(),
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

