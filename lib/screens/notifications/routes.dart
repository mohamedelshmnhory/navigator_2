import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'notifications.dart';

const notificationsTab = AutoRoute(
  path: 'notifications',
  page: EmptyRouterPage,
  name: 'NotificationsTab',
  children: [
    AutoRoute(
      path: '',
      page: NotificationsScreen,
      name: notifications,
    ),
  ],
);
