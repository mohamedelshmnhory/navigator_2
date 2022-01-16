import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'service_details_screen.dart';
import 'services_list_screen.dart';

const servicesTab = AutoRoute(
  path: 'services',
  page: EmptyRouterPage,
  name: 'ServicesTab',
  children: [
    AutoRoute(
      path: '',
      page: ServicesListScreen,
      name: services,
    ),
    AutoRoute(
      path: ':service',
      page: ServiceDetailsScreen,
      meta: {'hideBottomNav': true},
    ),
  ],
);
