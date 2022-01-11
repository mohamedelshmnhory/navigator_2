import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/layout.dart';
import 'package:beautyapp/layout/taps_name.dart';
import 'package:beautyapp/modules/about.dart';
import 'package:beautyapp/modules/auth/auth_home.dart';
import 'package:beautyapp/modules/auth/login_screen.dart';
import 'package:beautyapp/modules/auth/register_screen.dart';
import 'package:beautyapp/modules/auth/splash.dart';
import 'package:beautyapp/modules/categories/categories_list_screen.dart';
import 'package:beautyapp/modules/certifications_screen.dart';
import 'package:beautyapp/modules/competitions/competition_details_screen.dart';
import 'package:beautyapp/modules/competitions/competitions_list_screen.dart';
import 'package:beautyapp/modules/contact.dart';
import 'package:beautyapp/modules/courses/course_details_screen.dart';
import 'package:beautyapp/modules/courses/courses_list_screen.dart';
import 'package:beautyapp/modules/exams/exams_screen.dart';
import 'package:beautyapp/modules/favourites_list/favourites_list_screen.dart';
import 'package:beautyapp/modules/home/home_screen.dart';
import 'package:beautyapp/modules/my_courses/my_course_details_screen.dart';
import 'package:beautyapp/modules/my_courses/my_courses_list_screen.dart';
import 'package:beautyapp/modules/notifications.dart';
import 'package:beautyapp/modules/profile/edit_profile_screen.dart';
import 'package:beautyapp/modules/profile/profile_screen.dart';
import 'package:beautyapp/modules/search/search_screen.dart';
import 'package:beautyapp/modules/service_details_screen.dart';
import 'package:beautyapp/modules/services/services_list_screen.dart';
import 'package:beautyapp/modules/trainer_details_screen.dart';
import 'package:beautyapp/modules/trainers_list/trainers_list_screen.dart';
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
        AutoRoute(
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
              path: ':title',
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
        ),
        AutoRoute(
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
        ),
        AutoRoute(
          path: 'myCourses',
          page: EmptyRouterPage,
          name: 'MyCoursesTab',
          children: [
            AutoRoute(
              path: '',
              page: MyCoursesListScreen,
              name: myCourses,
            ),
            AutoRoute(
              path: ':courseId',
              page: MyCourseDetailsScreen,
              meta: {'hideBottomNav': true},
            ),
          ],
        ),
        AutoRoute(
          path: 'search',
          page: EmptyRouterPage,
          name: 'SearchTab',
          children: [
            AutoRoute(
              path: '',
              page: SearchScreen,
              name: search,
            ),
          ],
        ),
        AutoRoute(
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
        ),
        AutoRoute(
          path: 'notifications',
          page: EmptyRouterPage,
          name: 'NotificationsTab',
          children: [
            AutoRoute(
              path: '',
              page: NotificationsScreen,
              name: notifications,
            ),
          ],
        ),
        AutoRoute(
          path: 'categories',
          page: EmptyRouterPage,
          name: 'CategoriesTab',
          children: [
            AutoRoute(
              path: '',
              page: CategoriesListScreen,
              name: courses,
            ),
            AutoRoute(
              path: ':title',
              page: CoursesListScreen,
              meta: {'hideBottomNav': true},
            ),
            AutoRoute(
              path: ':courseId',
              page: CourseDetailsScreen,
              meta: {'hideBottomNav': true},
            ),
          ],
        ),
        AutoRoute(
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
        ),
        AutoRoute(
          path: 'trainers',
          page: EmptyRouterPage,
          name: 'TrainersTab',
          children: [
            AutoRoute(
              path: '',
              page: TrainersListScreen,
              name: trainers,
            ),
            AutoRoute(
              path: ':trainer',
              page: TrainerDetailsScreen,
              meta: {'hideBottomNav': true},
            ),
          ],
        ),
        AutoRoute(
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
        ),
        AutoRoute(
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
        ),
        AutoRoute(
          path: 'about',
          page: EmptyRouterPage,
          name: 'aboutTab',
          children: [
            AutoRoute(
              path: '',
              page: AboutScreen,
              name: about,
            ),
          ],
        ),
        AutoRoute(
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
        ),
      ],
    ),
    // auth
    AutoRoute(path: '/auth_home', page: AuthHome),
    AutoRoute(
      page: LoginScreen,
      path: '/login',
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(path: '/signup', page: RegisterScreen),
    RedirectRoute(path: '*', redirectTo: '/layout'),
    // AutoRoute(path: '/coursesList', page: CoursesListScreen),
    // AutoRoute(path: '/coursesDetails', page: CourseDetailsScreen),
    // AutoRoute(path: '/serviceDetails', page: ServiceDetailsScreen),
    // AutoRoute(path: '/trainerDetails', page: TrainerDetailsScreen),
    // AutoRoute(path: '/myCourseDetailsScreen', page: MyCourseDetailsScreen),
    // AutoRoute(path: '/competitionsListScreen', page: CompetitionsListScreen),
    // AutoRoute(
    //     path: '/competitionDetailsScreen', page: CompetitionDetailsScreen),
    // AutoRoute(path: '/editProfileScreen', page: EditProfileScreen),
  ],
)
class $AppRouter {}
