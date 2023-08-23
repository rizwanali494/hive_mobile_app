import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hive_mobile/app/navigation/go_router_observer.dart';

extension GoRouterExtOnBuildContext on BuildContext {
  /// A custom GoRouter extension that pops [until] it can
  /// and then pushes to [route] as replacing.
  ///
  /// If until is not provided gonna pop until it can.
  void pushAndRemoveUntil(
    String route, {
    Object? extra,
    bool Function(String? current)? until,
    bool replace = true,
  }) {
    while (until?.call(ModalRoute.of(this)?.settings.name) ?? canPop()) {
      if (canPop()) pop();
    }

    if (replace) return pushReplacementNamed(route, extra: extra);
    pushNamed(route, extra: extra);
  }

  /// A custom GoRouter extension that pops until it can
  /// and then pushes to [documentName] as replacing.
  ///
  /// If until is not provided gonna pop until it can.
  // void pushNamedAndRemoveUntil(
  //   String name, {
  //   Object? extra,
  //   Map<String, String> params = const {},
  //   Map<String, dynamic> queryParams = const <String, dynamic>{},
  //   bool Function(String? current)? until,
  // }) {
  //   while (until?.call(ModalRoute.of(this)?.settings.name) ?? canPop()) {
  //     if (canPop()) pop();
  //   }
  //   pushReplacementNamed(
  //     name,
  //     params: params,
  //     extra: extra,
  //     queryParams: queryParams,
  //   );
  // }

  void popUntil(String routeName) {
    final index = routingStack.toList().indexWhere((element) => element.settings.name == routeName);

    if (index > 0) {
      for (var i = routingStack.length; i >= index + 2; i--) {
        if (canPop()) pop();
      }
      return;
    }
  }
}