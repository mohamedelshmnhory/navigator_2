import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('New route pushed: ${route.settings.name}');
  }
  // ...
  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugPrint('Tab route visited: ${route.name}');
    debugPrint('Tab route visited: ${route.path}');
  }
  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugPrint('Tab route re-visited: ${route.name}');
    debugPrint('Tab route re-visited: ${route.path}');
  }
  // ...
}