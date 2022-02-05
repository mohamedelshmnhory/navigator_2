// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i28;

import '../layout/layout.dart' as _i2;
import '../models/services_model.dart' as _i30;
import '../models/trainers_model.dart' as _i31;
import '../screens/about/about.dart' as _i26;
import '../screens/auth/auth_home.dart' as _i3;
import '../screens/auth/login_screen.dart' as _i4;
import '../screens/auth/register_screen.dart' as _i5;
import '../screens/auth/splash.dart' as _i1;
import '../screens/categories/categories_list_screen.dart' as _i21;
import '../screens/certifications/endorsements_screen.dart' as _i22;
import '../screens/competitions/competition_details_screen.dart' as _i13;
import '../screens/competitions/competitions_list_screen.dart' as _i12;
import '../screens/contact/contact.dart' as _i27;
import '../screens/courses/course_details_screen.dart' as _i9;
import '../screens/courses/courses_list_screen.dart' as _i8;
import '../screens/exams/exams_screen.dart' as _i24;
import '../screens/favourites/favourites_list_screen.dart' as _i14;
import '../screens/home/home_screen.dart' as _i7;
import '../screens/my_courses/my_course_details_screen.dart' as _i16;
import '../screens/my_courses/my_courses_list_screen.dart' as _i15;
import '../screens/notifications/notifications.dart' as _i20;
import '../screens/profile/edit_profile_screen.dart' as _i19;
import '../screens/profile/profile_screen.dart' as _i18;
import '../screens/search/search_screen.dart' as _i17;
import '../screens/services/service_details_screen.dart' as _i10;
import '../screens/services/services_list_screen.dart' as _i25;
import '../screens/trainers/trainer_details_screen.dart' as _i11;
import '../screens/trainers/trainers_list_screen.dart' as _i23;
import 'auth_guard.dart' as _i29;

class AppRouter extends _i6.RootStackRouter {
  AppRouter(
      {_i28.GlobalKey<_i28.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i29.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    Layout.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Layout());
    },
    AuthHome.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AuthHome());
    },
    LoginScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginScreen());
    },
    RegisterScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RegisterScreen());
    },
    HomeTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    FavouriteTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    MyCoursesTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    SearchTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ProfileTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    NotificationsTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    CategoriesTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    EndorsementsTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    TrainersTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ExamsTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ServicesTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    AboutTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ContactTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    Home.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeScreen());
    },
    CoursesListScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CoursesListScreenArgs>(
          orElse: () => CoursesListScreenArgs(id: pathParams.optInt('id')));
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.CoursesListScreen(key: args.key, id: args.id));
    },
    CourseDetailsScreen.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseDetailsScreenArgs>(
          orElse: () => CourseDetailsScreenArgs(id: pathParams.optInt('id')));
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.CourseDetailsScreen(key: args.key, id: args.id));
    },
    ServiceDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<ServiceDetailsScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i10.ServiceDetailsScreen(key: args.key, service: args.service));
    },
    TrainerDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<TrainerDetailsScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i11.TrainerDetailsScreen(key: args.key, trainer: args.trainer));
    },
    CompetitionsListScreen.name: (routeData) {
      final args = routeData.argsAs<CompetitionsListScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.CompetitionsListScreen(key: args.key, title: args.title));
    },
    CompetitionDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<CompetitionDetailsScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i13.CompetitionDetailsScreen(key: args.key, title: args.title));
    },
    Favourite.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.FavouritesListScreen());
    },
    MyCourses.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.MyCoursesListScreen());
    },
    MyCourseDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<MyCourseDetailsScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.MyCourseDetailsScreen(
              key: args.key, courseId: args.courseId));
    },
    Search.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.SearchScreen());
    },
    Profile.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.ProfileScreen());
    },
    EditProfile.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.EditProfileScreen());
    },
    Notifications.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.NotificationsScreen());
    },
    Courses.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.CategoriesListScreen());
    },
    Endorsements.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.CertificationScreen());
    },
    Trainers.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.TrainersListScreen());
    },
    Exams.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.ExamsScreen());
    },
    Services.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.ServicesListScreen());
    },
    About.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.AboutScreen());
    },
    Contact.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.ContactScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreen.name, path: '/'),
        _i6.RouteConfig(Layout.name, path: '/layout', guards: [
          authGuard
        ], children: [
          _i6.RouteConfig(HomeTab.name,
              path: 'home',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Home.name, path: '', parent: HomeTab.name),
                _i6.RouteConfig(CoursesListScreen.name,
                    path: ':id',
                    parent: HomeTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true}),
                _i6.RouteConfig(CourseDetailsScreen.name,
                    path: 'CourseDetailsScreen/:id',
                    parent: HomeTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true}),
                _i6.RouteConfig(ServiceDetailsScreen.name,
                    path: ':service',
                    parent: HomeTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true}),
                _i6.RouteConfig(TrainerDetailsScreen.name,
                    path: ':trainer',
                    parent: HomeTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true}),
                _i6.RouteConfig(CompetitionsListScreen.name,
                    path: ':competitions',
                    parent: HomeTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true}),
                _i6.RouteConfig(CompetitionDetailsScreen.name,
                    path: ':compDetails',
                    parent: HomeTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true})
              ]),
          _i6.RouteConfig(FavouriteTab.name,
              path: 'favourite',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Favourite.name,
                    path: '', parent: FavouriteTab.name),
                _i6.RouteConfig(CourseDetailsScreen.name,
                    path: 'CourseDetailsScreen/:id',
                    parent: FavouriteTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true})
              ]),
          _i6.RouteConfig(MyCoursesTab.name,
              path: 'myCourses',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(MyCourses.name,
                    path: '', parent: MyCoursesTab.name),
                _i6.RouteConfig(MyCourseDetailsScreen.name,
                    path: ':courseId',
                    parent: MyCoursesTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true})
              ]),
          _i6.RouteConfig(SearchTab.name,
              path: 'search',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Search.name, path: '', parent: SearchTab.name),
                _i6.RouteConfig(CourseDetailsScreen.name,
                    path: 'CourseDetailsScreen/:id',
                    parent: SearchTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true})
              ]),
          _i6.RouteConfig(ProfileTab.name,
              path: 'profile',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Profile.name,
                    path: '', parent: ProfileTab.name),
                _i6.RouteConfig(EditProfile.name,
                    path: ':',
                    parent: ProfileTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true})
              ]),
          _i6.RouteConfig(NotificationsTab.name,
              path: 'notifications',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Notifications.name,
                    path: '', parent: NotificationsTab.name)
              ]),
          _i6.RouteConfig(CategoriesTab.name,
              path: 'categories',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Courses.name,
                    path: '', parent: CategoriesTab.name),
                _i6.RouteConfig(CoursesListScreen.name,
                    path: ':id',
                    parent: CategoriesTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true}),
                _i6.RouteConfig(CourseDetailsScreen.name,
                    path: 'CourseDetailsScreen/:id',
                    parent: CategoriesTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true}),
                _i6.RouteConfig('*#redirect',
                    path: '*',
                    parent: CategoriesTab.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i6.RouteConfig(EndorsementsTab.name,
              path: 'certifications',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Endorsements.name,
                    path: '', parent: EndorsementsTab.name)
              ]),
          _i6.RouteConfig(TrainersTab.name,
              path: 'trainers',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Trainers.name,
                    path: '', parent: TrainersTab.name),
                _i6.RouteConfig(TrainerDetailsScreen.name,
                    path: ':trainer',
                    parent: TrainersTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true})
              ]),
          _i6.RouteConfig(ExamsTab.name,
              path: 'exams',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Exams.name, path: '', parent: ExamsTab.name)
              ]),
          _i6.RouteConfig(ServicesTab.name,
              path: 'services',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Services.name,
                    path: '', parent: ServicesTab.name),
                _i6.RouteConfig(ServiceDetailsScreen.name,
                    path: ':service',
                    parent: ServicesTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true})
              ]),
          _i6.RouteConfig(AboutTab.name,
              path: 'about',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(About.name, path: '', parent: AboutTab.name)
              ]),
          _i6.RouteConfig(ContactTab.name,
              path: 'contact',
              parent: Layout.name,
              children: [
                _i6.RouteConfig(Contact.name, path: '', parent: ContactTab.name)
              ])
        ]),
        _i6.RouteConfig(AuthHome.name, path: '/auth_home'),
        _i6.RouteConfig(LoginScreen.name, path: '/login'),
        _i6.RouteConfig(RegisterScreen.name, path: '/signup'),
        _i6.RouteConfig('*#redirect',
            path: '*', redirectTo: '/layout', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i6.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.Layout]
class Layout extends _i6.PageRouteInfo<void> {
  const Layout({List<_i6.PageRouteInfo>? children})
      : super(Layout.name, path: '/layout', initialChildren: children);

  static const String name = 'Layout';
}

/// generated route for
/// [_i3.AuthHome]
class AuthHome extends _i6.PageRouteInfo<void> {
  const AuthHome() : super(AuthHome.name, path: '/auth_home');

  static const String name = 'AuthHome';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginScreen extends _i6.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterScreen extends _i6.PageRouteInfo<void> {
  const RegisterScreen() : super(RegisterScreen.name, path: '/signup');

  static const String name = 'RegisterScreen';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeTab extends _i6.PageRouteInfo<void> {
  const HomeTab({List<_i6.PageRouteInfo>? children})
      : super(HomeTab.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class FavouriteTab extends _i6.PageRouteInfo<void> {
  const FavouriteTab({List<_i6.PageRouteInfo>? children})
      : super(FavouriteTab.name, path: 'favourite', initialChildren: children);

  static const String name = 'FavouriteTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class MyCoursesTab extends _i6.PageRouteInfo<void> {
  const MyCoursesTab({List<_i6.PageRouteInfo>? children})
      : super(MyCoursesTab.name, path: 'myCourses', initialChildren: children);

  static const String name = 'MyCoursesTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class SearchTab extends _i6.PageRouteInfo<void> {
  const SearchTab({List<_i6.PageRouteInfo>? children})
      : super(SearchTab.name, path: 'search', initialChildren: children);

  static const String name = 'SearchTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ProfileTab extends _i6.PageRouteInfo<void> {
  const ProfileTab({List<_i6.PageRouteInfo>? children})
      : super(ProfileTab.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class NotificationsTab extends _i6.PageRouteInfo<void> {
  const NotificationsTab({List<_i6.PageRouteInfo>? children})
      : super(NotificationsTab.name,
            path: 'notifications', initialChildren: children);

  static const String name = 'NotificationsTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class CategoriesTab extends _i6.PageRouteInfo<void> {
  const CategoriesTab({List<_i6.PageRouteInfo>? children})
      : super(CategoriesTab.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoriesTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class EndorsementsTab extends _i6.PageRouteInfo<void> {
  const EndorsementsTab({List<_i6.PageRouteInfo>? children})
      : super(EndorsementsTab.name,
            path: 'certifications', initialChildren: children);

  static const String name = 'EndorsementsTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class TrainersTab extends _i6.PageRouteInfo<void> {
  const TrainersTab({List<_i6.PageRouteInfo>? children})
      : super(TrainersTab.name, path: 'trainers', initialChildren: children);

  static const String name = 'TrainersTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ExamsTab extends _i6.PageRouteInfo<void> {
  const ExamsTab({List<_i6.PageRouteInfo>? children})
      : super(ExamsTab.name, path: 'exams', initialChildren: children);

  static const String name = 'ExamsTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ServicesTab extends _i6.PageRouteInfo<void> {
  const ServicesTab({List<_i6.PageRouteInfo>? children})
      : super(ServicesTab.name, path: 'services', initialChildren: children);

  static const String name = 'ServicesTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class AboutTab extends _i6.PageRouteInfo<void> {
  const AboutTab({List<_i6.PageRouteInfo>? children})
      : super(AboutTab.name, path: 'about', initialChildren: children);

  static const String name = 'AboutTab';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ContactTab extends _i6.PageRouteInfo<void> {
  const ContactTab({List<_i6.PageRouteInfo>? children})
      : super(ContactTab.name, path: 'contact', initialChildren: children);

  static const String name = 'ContactTab';
}

/// generated route for
/// [_i7.HomeScreen]
class Home extends _i6.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '');

  static const String name = 'Home';
}

/// generated route for
/// [_i8.CoursesListScreen]
class CoursesListScreen extends _i6.PageRouteInfo<CoursesListScreenArgs> {
  CoursesListScreen({_i28.Key? key, int? id})
      : super(CoursesListScreen.name,
            path: ':id',
            args: CoursesListScreenArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'CoursesListScreen';
}

class CoursesListScreenArgs {
  const CoursesListScreenArgs({this.key, this.id});

  final _i28.Key? key;

  final int? id;

  @override
  String toString() {
    return 'CoursesListScreenArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.CourseDetailsScreen]
class CourseDetailsScreen extends _i6.PageRouteInfo<CourseDetailsScreenArgs> {
  CourseDetailsScreen({_i28.Key? key, int? id})
      : super(CourseDetailsScreen.name,
            path: 'CourseDetailsScreen/:id',
            args: CourseDetailsScreenArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'CourseDetailsScreen';
}

class CourseDetailsScreenArgs {
  const CourseDetailsScreenArgs({this.key, this.id});

  final _i28.Key? key;

  final int? id;

  @override
  String toString() {
    return 'CourseDetailsScreenArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.ServiceDetailsScreen]
class ServiceDetailsScreen extends _i6.PageRouteInfo<ServiceDetailsScreenArgs> {
  ServiceDetailsScreen({_i28.Key? key, required _i30.Service service})
      : super(ServiceDetailsScreen.name,
            path: ':service',
            args: ServiceDetailsScreenArgs(key: key, service: service));

  static const String name = 'ServiceDetailsScreen';
}

class ServiceDetailsScreenArgs {
  const ServiceDetailsScreenArgs({this.key, required this.service});

  final _i28.Key? key;

  final _i30.Service service;

  @override
  String toString() {
    return 'ServiceDetailsScreenArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i11.TrainerDetailsScreen]
class TrainerDetailsScreen extends _i6.PageRouteInfo<TrainerDetailsScreenArgs> {
  TrainerDetailsScreen({_i28.Key? key, required _i31.Trainer trainer})
      : super(TrainerDetailsScreen.name,
            path: ':trainer',
            args: TrainerDetailsScreenArgs(key: key, trainer: trainer));

  static const String name = 'TrainerDetailsScreen';
}

class TrainerDetailsScreenArgs {
  const TrainerDetailsScreenArgs({this.key, required this.trainer});

  final _i28.Key? key;

  final _i31.Trainer trainer;

  @override
  String toString() {
    return 'TrainerDetailsScreenArgs{key: $key, trainer: $trainer}';
  }
}

/// generated route for
/// [_i12.CompetitionsListScreen]
class CompetitionsListScreen
    extends _i6.PageRouteInfo<CompetitionsListScreenArgs> {
  CompetitionsListScreen({_i28.Key? key, required String title})
      : super(CompetitionsListScreen.name,
            path: ':competitions',
            args: CompetitionsListScreenArgs(key: key, title: title));

  static const String name = 'CompetitionsListScreen';
}

class CompetitionsListScreenArgs {
  const CompetitionsListScreenArgs({this.key, required this.title});

  final _i28.Key? key;

  final String title;

  @override
  String toString() {
    return 'CompetitionsListScreenArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i13.CompetitionDetailsScreen]
class CompetitionDetailsScreen
    extends _i6.PageRouteInfo<CompetitionDetailsScreenArgs> {
  CompetitionDetailsScreen({_i28.Key? key, required String title})
      : super(CompetitionDetailsScreen.name,
            path: ':compDetails',
            args: CompetitionDetailsScreenArgs(key: key, title: title));

  static const String name = 'CompetitionDetailsScreen';
}

class CompetitionDetailsScreenArgs {
  const CompetitionDetailsScreenArgs({this.key, required this.title});

  final _i28.Key? key;

  final String title;

  @override
  String toString() {
    return 'CompetitionDetailsScreenArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i14.FavouritesListScreen]
class Favourite extends _i6.PageRouteInfo<void> {
  const Favourite() : super(Favourite.name, path: '');

  static const String name = 'Favourite';
}

/// generated route for
/// [_i15.MyCoursesListScreen]
class MyCourses extends _i6.PageRouteInfo<void> {
  const MyCourses() : super(MyCourses.name, path: '');

  static const String name = 'MyCourses';
}

/// generated route for
/// [_i16.MyCourseDetailsScreen]
class MyCourseDetailsScreen
    extends _i6.PageRouteInfo<MyCourseDetailsScreenArgs> {
  MyCourseDetailsScreen({_i28.Key? key, required String courseId})
      : super(MyCourseDetailsScreen.name,
            path: ':courseId',
            args: MyCourseDetailsScreenArgs(key: key, courseId: courseId));

  static const String name = 'MyCourseDetailsScreen';
}

class MyCourseDetailsScreenArgs {
  const MyCourseDetailsScreenArgs({this.key, required this.courseId});

  final _i28.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'MyCourseDetailsScreenArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i17.SearchScreen]
class Search extends _i6.PageRouteInfo<void> {
  const Search() : super(Search.name, path: '');

  static const String name = 'Search';
}

/// generated route for
/// [_i18.ProfileScreen]
class Profile extends _i6.PageRouteInfo<void> {
  const Profile() : super(Profile.name, path: '');

  static const String name = 'Profile';
}

/// generated route for
/// [_i19.EditProfileScreen]
class EditProfile extends _i6.PageRouteInfo<void> {
  const EditProfile() : super(EditProfile.name, path: ':');

  static const String name = 'EditProfile';
}

/// generated route for
/// [_i20.NotificationsScreen]
class Notifications extends _i6.PageRouteInfo<void> {
  const Notifications() : super(Notifications.name, path: '');

  static const String name = 'Notifications';
}

/// generated route for
/// [_i21.CategoriesListScreen]
class Courses extends _i6.PageRouteInfo<void> {
  const Courses() : super(Courses.name, path: '');

  static const String name = 'Courses';
}

/// generated route for
/// [_i22.CertificationScreen]
class Endorsements extends _i6.PageRouteInfo<void> {
  const Endorsements() : super(Endorsements.name, path: '');

  static const String name = 'Endorsements';
}

/// generated route for
/// [_i23.TrainersListScreen]
class Trainers extends _i6.PageRouteInfo<void> {
  const Trainers() : super(Trainers.name, path: '');

  static const String name = 'Trainers';
}

/// generated route for
/// [_i24.ExamsScreen]
class Exams extends _i6.PageRouteInfo<void> {
  const Exams() : super(Exams.name, path: '');

  static const String name = 'Exams';
}

/// generated route for
/// [_i25.ServicesListScreen]
class Services extends _i6.PageRouteInfo<void> {
  const Services() : super(Services.name, path: '');

  static const String name = 'Services';
}

/// generated route for
/// [_i26.AboutScreen]
class About extends _i6.PageRouteInfo<void> {
  const About() : super(About.name, path: '');

  static const String name = 'About';
}

/// generated route for
/// [_i27.ContactScreen]
class Contact extends _i6.PageRouteInfo<void> {
  const Contact() : super(Contact.name, path: '');

  static const String name = 'Contact';
}
