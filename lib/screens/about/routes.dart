import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'about.dart';

const aboutTab = AutoRoute(
  path: 'about',
  page: EmptyRouterPage,
  name: 'aboutTab',
  children: [
    AutoRoute(
      path: '',
      page: AboutScreen,
      name: about,
    ),
  ],
);
