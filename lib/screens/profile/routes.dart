import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/taps_name.dart';

import 'edit_profile_screen.dart';
import 'profile_screen.dart';

const profileTab = AutoRoute(
  path: 'profile',
  page: EmptyRouterPage,
  name: 'ProfileTab',
  children: [
    AutoRoute(
      path: '',
      page: ProfileScreen,
      name: profile,
    ),
    AutoRoute(
      path: ':',
      page: EditProfileScreen,
      name: editProfile,
      meta: {'hideBottomNav': true},
    ),
  ],
);
