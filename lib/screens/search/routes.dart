import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'search_screen.dart';

const searchTab = AutoRoute(
  path: 'search',
  page: EmptyRouterPage,
  name: 'SearchTab',
  children: [
    AutoRoute(
      path: '',
      page: SearchScreen,
      name: search,
    ),
  ],
);
