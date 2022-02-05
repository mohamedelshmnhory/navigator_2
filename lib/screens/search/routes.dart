import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'package:beautyapp/screens/courses/course_details_screen.dart';
import 'package:beautyapp/screens/courses/routes.dart';
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
    courseScreen,
  ],
);
