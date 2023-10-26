import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/models/data/user_model/user_model.dart';
import 'package:hive_mobile/app/repositories/user_repository.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/services/api_services/api_services.dart';
import 'package:hive_mobile/app/view/dialogs/backup_emal_successful.dart';
import 'package:hive_mobile/app/view/util/util_functions.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/calender/view_models/calendar_vm.dart';
import 'package:hive_mobile/features/external_grading/view_models/external_grade_vm.dart';
import 'package:hive_mobile/features/home/view_models/drawer_widget_vm.dart';
import 'package:hive_mobile/features/home/widgets/drawer_widget.dart';
import 'package:hive_mobile/features/home/view_models/home_screen_vm.dart';
import 'package:hive_mobile/features/home/widgets/bottom_nav_bar_widget.dart';
import 'package:hive_mobile/features/inbox/view_models/inbox_screen_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/all_service_request_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/service_screen_vm.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_vm.dart';
import 'package:hive_mobile/features/notification/view_models/notification_screen_vm.dart';
import 'package:hive_mobile/features/profile/view_models/profile_screen_vm.dart';
import 'package:hive_mobile/features/reports/view_models/report_year1_vm.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:hive_mobile/features/session_notes/view_models/ack_session_note_vm.dart';
import 'package:hive_mobile/features/session_notes/view_models/pending_session_note_vm.dart';
import 'package:hive_mobile/features/session_notes/view_models/session_note_vm.dart';
import 'package:hive_mobile/features/university_application/view_models/accepted_application_vm.dart';
import 'package:hive_mobile/features/university_application/view_models/previous_application_vm.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   final email = await showDialog(
    //     context: context,
    //     builder: (context) => const BackUpEmailDialog(),
    //   );
    //   log("message : ${email}");
    //   if (email != null) {
    //     updateBackupEmail(email: email);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeScreenVm();
      },
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
            body: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => NewsFeedVM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => InboxScreenVM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => NotificationScreenVM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ReportYear1VM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ReportsScreenVM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ProfileScreenVM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ActivityScreenVM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => CalendarVM(),
                ),
                ChangeNotifierProvider(
                  create: (BuildContext context) => ServiceScreenVM(),
                ),
                ChangeNotifierProvider(
                  create: (BuildContext context) => AllServiceRequestVM(),
                ),
                ChangeNotifierProvider(
                  create: (BuildContext context) => ExternalGradeVM(),
                ),
                ChangeNotifierProvider(
                  create: (BuildContext context) => AcceptedApplicationVM(),
                ),
                ChangeNotifierProvider(
                  create: (BuildContext context) => PreviousApplicationVM(),
                ),
                ChangeNotifierProvider(
                  create: (BuildContext context) => SessionNoteVM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => ACKSessionNoteVM(),
                ),
                ChangeNotifierProvider(
                  create: (context) => PendingSessionNoteVM(),
                ),
              ],
              child: provider.currentPage,
            ),
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

  UserModel getUserModel() {
    return GetIt.instance.get<UserModel>();
  }

  final apiService = GetIt.instance.get<ApiService>();
  late final UserRepository userRepository =
      UserRepository(apiService: apiService);

  Future<void> updateBackupEmail({required String email}) async {
    log("here");
    final map = {"backup_email": email};
    UtilFunctions().showLoaderDialog(context);
    try {
      final response = await userRepository.updateBackupEmail(
          body: map, id: getUserModel().id ?? 0);
      context.pop();
      showDialog(
        context: context,
        builder: (context) => const BackUpEmaiSuccesfullDialog(),
      );
      return;
    } catch (e) {
      log("Backup email : ${e.toString()}");
    }
    context.pop();
    UtilFunctions.showToast(
        msg: "Something went wrong. Couldn't verify backup email");
  }
}
