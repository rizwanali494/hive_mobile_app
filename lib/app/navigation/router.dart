import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/enums/university_application_eums.dart';
import 'package:hive_mobile/app/models/data/external_grade_model.dart';
import 'package:hive_mobile/app/models/data/inbox_model.dart';
import 'package:hive_mobile/app/navigation/custom_go_route.dart';
import 'package:hive_mobile/app/navigation/go_router_observer.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';
import 'package:hive_mobile/app/view_models/base_status_controller.dart';
import 'package:hive_mobile/features/activities/screens/activities_screen.dart';
import 'package:hive_mobile/features/activities/screens/activity_details_screen.dart';
import 'package:hive_mobile/features/activities/view_models/activity_detail_vm.dart';
import 'package:hive_mobile/features/activities/view_models/activity_screen_vm.dart';
import 'package:hive_mobile/features/authentication/screens/sign_in_screen.dart';
import 'package:hive_mobile/features/calender/screens/calendar_screen.dart';
import 'package:hive_mobile/features/calender/screens/days_event_screen.dart';
import 'package:hive_mobile/features/email_verification/screens/email_verification_screen.dart';
import 'package:hive_mobile/features/email_verification/screens/mail_sent_screen.dart';
import 'package:hive_mobile/features/external_grading/screens/adding_external_grade_screen.dart';
import 'package:hive_mobile/features/external_grading/screens/external_grading_screen.dart';
import 'package:hive_mobile/features/external_grading/screens/grade_details_screen.dart';
import 'package:hive_mobile/features/external_grading/view_models/grade_adding_vm.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:hive_mobile/features/inbox/screens/chat_screens/chat_screen.dart';
import 'package:hive_mobile/features/inbox/screens/inbox_search_screen.dart';
import 'package:hive_mobile/features/inbox/screens/new_conversations/new_conversation.dart';
import 'package:hive_mobile/features/my_services/screens/my_services_screen.dart';
import 'package:hive_mobile/features/my_services/screens/new_request_screen.dart';
import 'package:hive_mobile/features/profile/screens/account_setting_screen.dart';
import 'package:hive_mobile/features/reports/screens/report_web_view.dart';
import 'package:hive_mobile/features/session_notes/screens/session_notes_screen.dart';
import 'package:hive_mobile/features/university_application/screens/application_info_screen.dart';
import 'package:hive_mobile/features/university_application/screens/university_app_request_screen.dart';
import 'package:hive_mobile/features/university_application/screens/university_application_screen.dart';
import 'package:hive_mobile/features/university_application/view_models/request_vm.dart';
import 'package:hive_mobile/splash.dart';

export 'extensions.dart';

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  observers: [
    GoRouterObserver(),
  ],
  routes: [
    CustomGoRoute.cupertino(
      path: '/',
      fullscreenDialog: true,
      // childBuilder: (_, __) => const CreateDigitalCardScreen(),
      childBuilder: (_, __) => const SplashScreen(),
    ),
    // CustomGoRoute.cupertino(
    //   path: EmbeddedAuthBuilder.route,
    //   fullscreenDialog: true,
    //   childBuilder: (context, state) => EmbeddedAuthBuilder(type: state.extra as LocalAuthWayType?),
    // ),
    CustomGoRoute.cupertino(
      path: SignInScreen.route,
      name: SignInScreen.route,
      builder: (_, state) => const SignInScreen(),
    ),
    CustomGoRoute.cupertino(
      path: HomeScreen.route,
      name: HomeScreen.route,
      builder: (_, state) => const HomeScreen(),
    ),
    CustomGoRoute.cupertino(
      path: InboxSearchScreen.route,
      name: InboxSearchScreen.route,
      builder: (_, state) => const InboxSearchScreen(),
    ),
    CustomGoRoute.cupertino(
      path: AccountSettingScreen.route,
      name: AccountSettingScreen.route,
      builder: (_, state) => const AccountSettingScreen(),
    ),
    CustomGoRoute.cupertino(
      path: ActivitiesScreen.route,
      name: ActivitiesScreen.route,
      builder: (_, state) => const ActivitiesScreen(),
    ),
    CustomGoRoute.cupertino(
      path: ActivityDetailScreen.route,
      name: ActivityDetailScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        ActivityDetailVM controller = extra?["controller"];
        ActivityScreenVM? provider = extra?["activityController"];
        return ActivityDetailScreen(
          controller: controller,
          activityProvider: provider,
        );
      },
    ),
    CustomGoRoute.cupertino(
      path: UniversityApplicationScreen.route,
      name: UniversityApplicationScreen.route,
      builder: (_, state) => const UniversityApplicationScreen(),
    ),
    CustomGoRoute.cupertino(
      path: UniversitySelectionScreen.route,
      name: UniversitySelectionScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        UniAppRequestVM? model;
        if (extra != null) {
          model = extra["provider"];
        }
        return UniversitySelectionScreen(
          model: model,
        );
      },
    ),
    CustomGoRoute.cupertino(
      path: ApplicationInfoScreen.route,
      name: ApplicationInfoScreen.route,
      builder: (_, state) => const ApplicationInfoScreen(),
    ),
    CustomGoRoute.cupertino(
      path: DescriptionScreen.route,
      name: DescriptionScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        ApplicationState? status;
        BaseStatusController? statusController;
        status = extra?["status"];
        statusController = extra?["status_controller"];
        var description = extra?["description"] ?? "";
        log(description.toString());
        String? title = extra?["title"];
        return DescriptionScreen(
          applicationStatus: status,
          description: description,
          title: title,
          statusController: statusController,
        );
      },
    ),
    CustomGoRoute.cupertino(
      path: SessionNotesScreen.route,
      name: SessionNotesScreen.route,
      builder: (_, state) => const SessionNotesScreen(),
    ),
    CustomGoRoute.cupertino(
      path: MyServicesScreen.route,
      name: MyServicesScreen.route,
      builder: (_, state) => const MyServicesScreen(),
    ),
    CustomGoRoute.cupertino(
      path: NewRequestScreen.route,
      name: NewRequestScreen.route,
      builder: (_, state) => const NewRequestScreen(),
    ),
    CustomGoRoute.cupertino(
      path: AddExternalGradeScreen.route,
      name: AddExternalGradeScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        List<String> addedGrades = extra?["addedGrades"] ?? [];
        GradeAddingVM? controller = extra?["controller"];
        return AddExternalGradeScreen(
          addedGrades: addedGrades,
          controller: controller,
        );
      },
    ),
    CustomGoRoute.cupertino(
      path: ExternalGradingScreen.route,
      name: ExternalGradingScreen.route,
      builder: (_, state) => const ExternalGradingScreen(),
    ),
    CustomGoRoute.cupertino(
      path: GradeDetailsScreen.route,
      name: GradeDetailsScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        ExternalGradeModel model;
        model = extra?["model"];
        Function(ExternalGradeModel? model) onChange =
            extra?["onChange"] ?? (m) {};
        Function(ExternalGradeModel? model) onDelete =
            extra?["onDelete"] ?? (m) {};
        return GradeDetailsScreen(
          model: model,
          onChange: onChange,
          onDelete: onDelete,
        );
      },
    ),
    CustomGoRoute.cupertino(
      path: CalendarScreen.route,
      name: CalendarScreen.route,
      builder: (_, state) => const CalendarScreen(),
    ),
    CustomGoRoute.cupertino(
      path: DaysEventScreen.route,
      name: DaysEventScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        DateTime model = extra?["date"] ?? DateTime.now();
        return DaysEventScreen(date: model);
      },
    ),
    CustomGoRoute.cupertino(
      path: NewConversationScreen.route,
      name: NewConversationScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        List<InboxModel> list = extra?["list"] ?? [];
        return NewConversationScreen(
          conversation: list,
        );
      },
    ),
    CustomGoRoute.cupertino(
      path: ChatScreen.route,
      name: ChatScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        InboxModel model = extra?["receiverId"] ?? InboxModel();
        return ChatScreen(
          inboxModel: model,
        );
      },
    ),
    CustomGoRoute.cupertino(
      path: MailSentScreen.route,
      name: MailSentScreen.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        String email = extra?["list"] ?? "";
        return MailSentScreen(
          email: email,
        );
      },
    ),
    CustomGoRoute.cupertino(
      path: EmailVerificationScreen.route,
      name: EmailVerificationScreen.route,
      builder: (_, state) {
        return EmailVerificationScreen();
      },
    ),
    CustomGoRoute.cupertino(
      path: ReportWebView.route,
      name: ReportWebView.route,
      builder: (_, state) {
        var extra = state.extra as Map<String, dynamic>?;
        String token = extra?["token"] ?? "";
        return ReportWebView(
          token: token,
        );
      },
    ),
    // CustomGoRoute.cupertino(
    //   path: '/${IncompleteIdentificationScreen.route}',
    //   name: IncompleteIdentificationScreen.route,
    //   fullscreenDialog: true,
    //   childBuilder: (context, state) => const IncompleteIdentificationScreen(),
    // ),
    //
    // CustomGoRoute.cupertino(
    //   path: '/${CreateDigitalCardSuccessScreen.route}',
    //   name: CreateDigitalCardSuccessScreen.route,
    //   childBuilder: (context, state) {
    //     final extra = state.extra as Map<String, dynamic>?;
    //     return CreateDigitalCardSuccessScreen(productId: extra!['productId'] as int);
    //   },
    // ),
  ],
);

// void goToOrigin(BuildContext context, {int? homeIndex}) {
//   // INFO: add more starting routes if needed.
//   final cardDetailsScreenIndex = routingStack
//       .toList()
//       .indexWhere((element) => element.settings.name == CardDetailsScreen.name);
//
//   if (cardDetailsScreenIndex > 0) {
//     for (var i = routingStack.length; i >= cardDetailsScreenIndex + 2; i--) {
//       if (context.canPop()) context.pop();
//     }
//     return;
//   }
//
//   final containsHome = routingStack.any((element) => element.settings.name == HomeScreen.route);
//   if (containsHome) return context.popUntil(HomeScreen.route);
//
//   context.pushNamed(HomeScreen.route, extra: homeIndex);
// }
