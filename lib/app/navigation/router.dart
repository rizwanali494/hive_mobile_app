
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/navigation/custom_go_route.dart';
import 'package:hive_mobile/app/navigation/go_router_observer.dart';
import 'package:hive_mobile/features/home/screens/home_screen.dart';
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
      builder: (_, state) => const HomeScreen(),
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