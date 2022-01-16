import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/models/categories_model.dart';
import 'package:beautyapp/models/course_model.dart';
import 'package:beautyapp/models/courses_model.dart';
import 'package:beautyapp/models/home_model.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/network/end_points.dart';
import 'package:beautyapp/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  late AnimationController animationController;
  late AnimationController menuButton;
  static LayoutCubit get(context) => BlocProvider.of(context);

  void openCloseDrawer(BuildContext context) {
    animationController.isCompleted ? reverse() : forward();
  }

  void forward() {
    animationController.forward();
    menuButton.forward();
  }

  void reverse() {
    animationController.reverse();
    menuButton.reverse();
  }

  void dispose() {
    animationController.dispose();
    menuButton.dispose();
  }

  int currentIndex = 0;
  late TabsRouter tabsRouter;

  HomeModel? homeModel;

  void getHome() async {
    emit(HomeLoadingState());

    await DioHelper.getData(
      url: HOMEPOINT,
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        homeModel = HomeModel.fromJson(value.data);
        emit(HomeSuccessState(homeModel!));
      } else {
        emit(HomeErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(HomeErrorState(internetErrorMsg));
    });

    return Future.value();
  }

  CategoriesModel? categoriesModel;

  void getCategories() async {
    emit(CategoriesLoadingState());
    DioHelper.getData(
      url: 'category/show',
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        categoriesModel = CategoriesModel.fromJson(value.data);
        emit(CategoriesSuccessState(categoriesModel!));
      } else {
        emit(CategoriesErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CategoriesErrorState(internetErrorMsg));
    });
  }

  CoursesModel? coursesModel;

  void getCourses({required int id}) async {
    emit(CoursesLoadingState());
    DioHelper.getData(
      url: 'category/show/$id',
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        coursesModel = CoursesModel.fromJson(value.data);
        emit(CoursesSuccessState(coursesModel!));
      } else {
        emit(CoursesErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CoursesErrorState(internetErrorMsg));
    });
  }

  CourseModel? courseModel;

  void getCourse({required int id}) async {
    emit(CourseLoadingState());
    DioHelper.getData(
      url: 'Courses/show/$id',
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        courseModel = CourseModel.fromJson(value.data);
        emit(CourseSuccessState(courseModel!));
      } else {
        emit(CourseErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CourseErrorState(internetErrorMsg));
    });
  }

  // late List<Widget> bottomScreens = [
  //   const HomeScreen(),
  //   const FavouritesListScreen(),
  //   const MyCoursesListScreen(),
  //   const SearchScreen(),
  //   const ProfileScreen(),
  //   const ShouldLogin(child: NotificationsScreen()),
  //   const CategoriesListScreen(),
  //   const EndorsementsScreen(),
  //   const TrainersListScreen(),
  //   const SizedBox(),
  //   const ServicesListScreen(),
  //   const AboutScreen(),
  //   const ContactScreen(),
  // ];

  void changeBottom(int index) {
    currentIndex = index;
    if (tabsRouter.activeIndex == index && tabsRouter.canPopSelfOrChildren) {
      tabsRouter.popTop();
    } else {
      tabsRouter.setActiveIndex(index);
    }
    // emit(LayoutChangeBottomNavState());
  }
}
