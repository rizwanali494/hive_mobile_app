import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

CupertinoPage<Widget> _buildCustomPageTransition({
  LocalKey? key,
  String? name,
  String? title,
  Object? arguments,
  required Widget child,
  String? restorationId,
  bool maintainState = true,
  bool fullscreenDialog = false,
  bool allowSnapshotting = true,
}) {
  return CupertinoPage(
    key: key,
    name: name,
    title: title,
    child: child,
    arguments: arguments,
    restorationId: restorationId,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
    allowSnapshotting: allowSnapshotting,
  );
}

///[CustomGoRoute] is a wrapper above [GoRoute]
class CustomGoRoute extends GoRoute {
  CustomGoRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.routes,
    super.redirect,
  });

  ///[CustomGoRoute.cupertino] is factory that builds a [GoRoute] with [CupertinoPage] transition
  factory CustomGoRoute.cupertino({
    required String path,
    String? name,
    List<RouteBase> routes = const <RouteBase>[],
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
    GlobalKey<NavigatorState>? parentNavigatorKey,
    Widget Function(BuildContext, GoRouterState)? builder,
    Widget Function(BuildContext context, GoRouterState state)? childBuilder,
    bool fullscreenDialog = false,
  }) {
    return CustomGoRoute(
      path: path,
      name: name,
      builder: builder,
      pageBuilder: builder == null && childBuilder != null
          ? (context, state) => _buildCustomPageTransition(
                name: name,
                child: childBuilder(context, state),
                fullscreenDialog: fullscreenDialog,
              )
          : null,
      parentNavigatorKey: parentNavigatorKey,
      routes: routes,
      redirect: redirect,
    );
  }
}
