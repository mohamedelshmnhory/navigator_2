import 'package:beautyapp/models/categories_model.dart';
import 'package:beautyapp/models/certifications_model.dart';
import 'package:beautyapp/models/course_model.dart';
import 'package:beautyapp/models/courses_model.dart';
import 'package:beautyapp/models/home_model.dart';
import 'package:beautyapp/models/services_model.dart';
import 'package:beautyapp/models/trainers_model.dart';

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class LayoutChangeBottomNavState extends LayoutStates {}

class HomeScrollTopState extends LayoutStates {}

class HomeLoadingState extends LayoutStates {}

class HomeSuccessState extends LayoutStates {
  final HomeModel homeModel;
  HomeSuccessState(this.homeModel);
}

class HomeErrorState extends LayoutStates {
  final String? error;
  HomeErrorState(this.error);
}

class CategoriesLoadingState extends LayoutStates {}

class CategoriesSuccessState extends LayoutStates {
  final CategoriesModel categoriesModel;
  CategoriesSuccessState(this.categoriesModel);
}

class CategoriesErrorState extends LayoutStates {
  final String? error;
  CategoriesErrorState(this.error);
}

class CoursesLoadingState extends LayoutStates {}

class CoursesSuccessState extends LayoutStates {
  final CoursesModel coursesModel;
  CoursesSuccessState(this.coursesModel);
}

class CoursesErrorState extends LayoutStates {
  final String? error;
  CoursesErrorState(this.error);
}

class CourseLoadingState extends LayoutStates {}

class CourseSuccessState extends LayoutStates {
  final CourseModel courseModel;
  CourseSuccessState(this.courseModel);
}

class CourseErrorState extends LayoutStates {
  final String? error;
  CourseErrorState(this.error);
}

class FavouriteLoadingState extends LayoutStates {}

class FavouriteSuccessState extends LayoutStates {}

class FavouriteErrorState extends LayoutStates {
  final String? error;
  FavouriteErrorState(this.error);
}

class SearchLoadingState extends LayoutStates {}

class SearchSuccessState extends LayoutStates {
  final CoursesModel coursesModel;
  SearchSuccessState(this.coursesModel);
}

class SearchErrorState extends LayoutStates {
  final String? error;
  SearchErrorState(this.error);
}

class TrainersLoadingState extends LayoutStates {}

class TrainersSuccessState extends LayoutStates {
  final TrainersModel trainersModel;
  TrainersSuccessState(this.trainersModel);
}

class TrainersErrorState extends LayoutStates {
  final String? error;
  TrainersErrorState(this.error);
}

class ServicesLoadingState extends LayoutStates {}

class ServicesSuccessState extends LayoutStates {
  final ServicesModel servicesModel;
  ServicesSuccessState(this.servicesModel);
}

class ServicesErrorState extends LayoutStates {
  final String? error;
  ServicesErrorState(this.error);
}

class CertificationsLoadingState extends LayoutStates {}

class CertificationsSuccessState extends LayoutStates {
  final CertificationsModel certificationsModel;
  CertificationsSuccessState(this.certificationsModel);
}

class CertificationsErrorState extends LayoutStates {
  final String? error;
  CertificationsErrorState(this.error);
}

class ContactLoadingState extends LayoutStates {}

class ContactSuccessState extends LayoutStates {
  final String? msg;
  ContactSuccessState(this.msg);
}

class ContactErrorState extends LayoutStates {
  final String? error;
  ContactErrorState(this.error);
}

class AboutLoadingState extends LayoutStates {}

class AboutSuccessState extends LayoutStates {
  final String? msg;
  AboutSuccessState(this.msg);
}

class AboutErrorState extends LayoutStates {
  final String? error;
  AboutErrorState(this.error);
}

class ResCourseLoadingState extends LayoutStates {}

class ResCourseSuccessState extends LayoutStates {
  final String? msg;
  ResCourseSuccessState(this.msg);
}

class ResCourseErrorState extends LayoutStates {
  final String? error;
  ResCourseErrorState(this.error);
}