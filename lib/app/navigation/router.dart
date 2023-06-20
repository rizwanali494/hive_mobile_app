import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/navigation/custom_go_route.dart';
import 'package:hive_mobile/app/navigation/go_router_observer.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
import 'package:hive_mobile/features/profile/screens/account_setting_screen.dart';
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
      path: HomeScreen.route,
      name: HomeScreen.route,
      builder: (_, state) => HomeScreen(),
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
      builder: (_, state) => const ActivityDetailScreen(),
    ),
    CustomGoRoute.cupertino(
      path: UniversityApplicationScreen.route,
      name: UniversityApplicationScreen.route,
      builder: (_, state) => const UniversityApplicationScreen(),
    ),
    CustomGoRoute.cupertino(
      path: UniversitySelectionScreen.route,
      name: UniversitySelectionScreen.route,
      builder: (_, state) => const UniversitySelectionScreen(),
    ),
    CustomGoRoute.cupertino(
      path: ApplicationInfoScreen.route,
      name: ApplicationInfoScreen.route,
      builder: (_, state) => const ApplicationInfoScreen(),
    ),
    CustomGoRoute.cupertino(
      path: DescriptionScreen.route,
      name: DescriptionScreen.route,
      builder: (_, state) => const DescriptionScreen(),
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
      builder: (_, state) => const AddExternalGradeScreen(),
    ),
    CustomGoRoute.cupertino(
      path: ExternalGradingScreen.route,
      name: ExternalGradingScreen.route,
      builder: (_, state) => const ExternalGradingScreen(),
    ),
    CustomGoRoute.cupertino(
      path: GradeDetailsScreen.route,
      name: GradeDetailsScreen.route,
      builder: (_, state) => const GradeDetailsScreen(),
    ),
    CustomGoRoute.cupertino(
      path: CalendarScreen.route,
      name: CalendarScreen.route,
      builder: (_, state) => const CalendarScreen(),
    ),
    CustomGoRoute.cupertino(
      path: NewConversationScreen.route,
      name: NewConversationScreen.route,
      builder: (_, state) => const NewConversationScreen(),
    ),
    CustomGoRoute.cupertino(
      path: ChatScreen.route,
      name: ChatScreen.route,
      builder: (_, state) => const ChatScreen(),
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
