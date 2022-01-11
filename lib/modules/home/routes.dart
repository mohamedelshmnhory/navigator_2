import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/modules/categories/categories_list_screen.dart';
import 'package:beautyapp/modules/courses/courses_list_screen.dart';
import 'package:beautyapp/modules/home/home_screen.dart';
import 'package:beautyapp/routes/auth_guard.dart';


const homeTab = AutoRoute(
  path: 'home',
  page: EmptyRouterPage,
  name: 'homeTab',
  children: [
    AutoRoute(path: '', page: HomeScreen),
    AutoRoute(
      path: ':title',
      usesPathAsKey: true,
      page: CoursesListScreen,
      guards: [AuthGuard],
    ),
  ],
);
