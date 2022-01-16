import 'package:beautyapp/models/categories_model.dart';
import 'package:beautyapp/models/course_model.dart';
import 'package:beautyapp/models/courses_model.dart';
import 'package:beautyapp/models/home_model.dart';

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class LayoutChangeBottomNavState extends LayoutStates {}

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