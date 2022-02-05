import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'endorsements_screen.dart';

const endorsementsTab = AutoRoute(
  path: 'certifications',
  page: EmptyRouterPage,
  name: 'EndorsementsTab',
  children: [
    AutoRoute(
      path: '',
      page: CertificationScreen,
      name: endorsements,
    ),
  ],
);
