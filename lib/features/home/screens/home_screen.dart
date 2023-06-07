import 'package:flutter/material.dart';
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
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeScreenVm(),
      child: Consumer<HomeScreenVm>(
        builder: (context, provider, child) {
          return Scaffold(
            drawer: const Drawer(),
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
