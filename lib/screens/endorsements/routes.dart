import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'endorsements_screen.dart';

const endorsementsTab = AutoRoute(
  path: 'endorsements',
  page: EmptyRouterPage,
  name: 'EndorsementsTab',
  children: [
    AutoRoute(
      path: '',
      page: EndorsementsScreen,
      name: endorsements,
    ),
  ],
);
