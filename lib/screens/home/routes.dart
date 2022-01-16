import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'package:beautyapp/screens/competitions/competition_details_screen.dart';
import 'package:beautyapp/screens/competitions/competitions_list_screen.dart';
import 'package:beautyapp/screens/courses/course_details_screen.dart';
import 'package:beautyapp/screens/courses/courses_list_screen.dart';
import 'package:beautyapp/screens/home/home_screen.dart';
import '../services/service_details_screen.dart';
import '../trainers/trainer_details_screen.dart';

const homeTab = AutoRoute(
  path: 'home',
  page: EmptyRouterPage,
  name: 'HomeTab',
  children: [
    AutoRoute(
      path: '',
      page: HomeScreen,
      name: home,
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
    AutoRoute(
      path: ':service',
      page: ServiceDetailsScreen,
      meta: {'hideBottomNav': true},
    ),
    AutoRoute(
      path: ':trainer',
      page: TrainerDetailsScreen,
      meta: {'hideBottomNav': true},
    ),
    AutoRoute(
      path: ':competitions',
      page: CompetitionsListScreen,
      meta: {'hideBottomNav': true},
    ),
    AutoRoute(
      path: ':compDetails',
      page: CompetitionDetailsScreen,
      meta: {'hideBottomNav': true},
    ),
  ],
);
