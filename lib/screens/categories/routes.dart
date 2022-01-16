import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'package:beautyapp/screens/courses/course_details_screen.dart';
import 'package:beautyapp/screens/courses/courses_list_screen.dart';
import 'categories_list_screen.dart';


const categoriesTab = AutoRoute(
  path: 'categories',
  page: EmptyRouterPage,
  name: 'CategoriesTab',
  children: [
    AutoRoute(
      path: '',
      page: CategoriesListScreen,
      name: courses,
    ),
    AutoRoute(
      path: ':id',
      page: CoursesListScreen,
      meta: {'hideBottomNav': true},
    ),
    AutoRoute(
      path: ':courseId',
      page: CourseDetailsScreen,
      meta: {'hideBottomNav': true},
    ),
  ],
);
