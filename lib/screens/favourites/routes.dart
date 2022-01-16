import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'package:beautyapp/screens/courses/course_details_screen.dart';
import 'favourites_list_screen.dart';

const favouritesTab = AutoRoute(
  path: 'favourite',
  page: EmptyRouterPage,
  name: 'FavouriteTab',
  children: [
    AutoRoute(
      path: '',
      page: FavouritesListScreen,
      name: favourite,
    ),
    AutoRoute(
      path: ':courseId',
      page: CourseDetailsScreen,
      meta: {'hideBottomNav': true},
    ),
  ],
);
