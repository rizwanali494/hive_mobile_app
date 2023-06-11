import 'dart:collection';

import 'package:flutter/cupertino.dart';

final routingStack = Queue<Route<dynamic>>();

extension StackFunctionsOnQueue<T> on Queue<T> {
  T pop() => removeLast();

  void push(T value) => add(value);
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    routingStack.pop();
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    routingStack.push(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    routingStack.pop();
    if (newRoute != null) routingStack.push(newRoute);
  }
}
