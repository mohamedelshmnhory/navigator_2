import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/layout.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'package:beautyapp/screens/about/about.dart';
import 'package:beautyapp/screens/about/routes.dart';
import 'package:beautyapp/screens/auth/auth_home.dart';
import 'package:beautyapp/screens/auth/login_screen.dart';
import 'package:beautyapp/screens/auth/register_screen.dart';
import 'package:beautyapp/screens/auth/splash.dart';
import 'package:beautyapp/screens/categories/routes.dart';
import 'package:beautyapp/screens/contact/contact.dart';
import 'package:beautyapp/screens/contact/routes.dart';
import 'package:beautyapp/screens/endorsements/routes.dart';
import 'package:beautyapp/screens/exams/exams_screen.dart';
import 'package:beautyapp/screens/exams/routes.dart';
import 'package:beautyapp/screens/favourites/routes.dart';
import 'package:beautyapp/screens/home/routes.dart';
import 'package:beautyapp/screens/my_courses/routes.dart';
import 'package:beautyapp/screens/notifications/routes.dart';
import 'package:beautyapp/screens/profile/routes.dart';
import 'package:beautyapp/screens/search/routes.dart';
import 'package:beautyapp/screens/services/service_details_screen.dart';
import 'package:beautyapp/screens/services/routes.dart';
import 'package:beautyapp/screens/services/services_list_screen.dart';
import 'package:beautyapp/screens/trainers/routes.dart';

import 'auth_guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Dialog,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashScreen,
    ),
    AutoRoute(
      path: '/layout',
      page: Layout,
      guards: [AuthGuard],
      children: [
        homeTab,
        favouritesTab,
        myCoursesTab,
        searchTab,
        profileTab,
        notificationsTab,
        categoriesTab,
        endorsementsTab,
        trainersTab,
        examsTab,
        servicesTab,
        aboutTab,
        contactTab,
      ],
    ),
    // auth
    AutoRoute(path: '/auth_home', page: AuthHome),
    AutoRoute(page: LoginScreen, path: '/login'),
    AutoRoute(path: '/signup', page: RegisterScreen),
    RedirectRoute(path: '*', redirectTo: '/layout'),
  ],
)

class $AppRouter {}
