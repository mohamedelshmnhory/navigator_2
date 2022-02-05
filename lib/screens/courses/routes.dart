import 'package:auto_route/auto_route.dart';
import 'course_details_screen.dart';


const courseScreen = AutoRoute(
  path: 'CourseDetailsScreen/:id',
  page: CourseDetailsScreen,
  meta: {'hideBottomNav': true},
);
