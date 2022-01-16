import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'contact.dart';


const contactTab = AutoRoute(
  path: 'contact',
  page: EmptyRouterPage,
  name: 'ContactTab',
  children: [
    AutoRoute(
      path: '',
      page: ContactScreen,
      name: contact,
    ),
  ],
);
