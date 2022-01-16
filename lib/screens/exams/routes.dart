import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'exams_screen.dart';

const examsTab = AutoRoute(
  path: 'exams',
  page: EmptyRouterPage,
  name: 'ExamsTab',
  children: [
    AutoRoute(
      path: '',
      page: ExamsScreen,
      name: exams,
    ),
  ],
);
