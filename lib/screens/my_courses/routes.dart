import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';

import 'my_course_details_screen.dart';
import 'my_courses_list_screen.dart';

const myCoursesTab = AutoRoute(
  path: 'myCourses',
  page: EmptyRouterPage,
  name: 'MyCoursesTab',
  children: [
    AutoRoute(
      path: '',
      page: MyCoursesListScreen,
      name: myCourses,
    ),
    AutoRoute(
      path: ':courseId',
      page: MyCourseDetailsScreen,
      meta: {'hideBottomNav': true},
    ),
  ],
);
