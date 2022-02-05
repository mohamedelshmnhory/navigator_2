import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/models/categories_model.dart';
import 'package:beautyapp/models/certifications_model.dart';
import 'package:beautyapp/models/course_model.dart';
import 'package:beautyapp/models/courses_model.dart';
import 'package:beautyapp/models/home_model.dart';
import 'package:beautyapp/models/services_model.dart';
import 'package:beautyapp/models/trainers_model.dart';
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

  void getTrainers() async {
    emit(TrainersLoadingState());
    DioHelper.getData(
      url: 'instructors/show',
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        TrainersModel trainersModel = TrainersModel.fromJson(value.data);
        emit(TrainersSuccessState(trainersModel));
      } else {
        emit(TrainersErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(TrainersErrorState(internetErrorMsg));
    });
  }

  void getServices() async {
    emit(ServicesLoadingState());
    DioHelper.getData(
      url: 'services/show',
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        ServicesModel servicesModel = ServicesModel.fromJson(value.data);
        emit(ServicesSuccessState(servicesModel));
      } else {
        emit(ServicesErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ServicesErrorState(internetErrorMsg));
    });
  }

  void getCertifications() async {
    emit(CertificationsLoadingState());
    DioHelper.getData(
      url: 'dependencies/showAll',
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        CertificationsModel servicesModel =
            CertificationsModel.fromJson(value.data);
        emit(CertificationsSuccessState(servicesModel));
      } else {
        emit(CertificationsErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(CertificationsErrorState(internetErrorMsg));
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
      if (value.data['status'] || !value.data['status']) {
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

  void getSearchCourses({required String title}) async {
    emit(SearchLoadingState());
    await DioHelper.getData(
      url: 'Courses/search/$title',
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        CoursesModel? model = CoursesModel.fromJson(value.data);
        emit(SearchSuccessState(model));
      } else {
        emit(SearchErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SearchErrorState(internetErrorMsg));
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

  CoursesModel? favouriteCoursesModel;
  List<Course> listOfFavourites = [];

  void getFavouriteCourses() async {
    emit(FavouriteLoadingState());
    if (userToken != '') {
      await DioHelper.getData(
        url: 'AllFavorite',
        token: userToken,
      ).then((value) {
        debugPrint(value.data.toString());
        if (value.data['status'] || !value.data['status']) {
          favouriteCoursesModel = CoursesModel.fromJson(value.data);
          listOfFavourites = favouriteCoursesModel!.data!;
          emit(FavouriteSuccessState());
        } else {
          emit(FavouriteErrorState(value.data['message']));
        }
      }).catchError((error) {
        debugPrint(error.toString());
        emit(FavouriteErrorState(internetErrorMsg));
      });
    }
    return Future.value();
  }

  void toggleFav({required Course course}) async {
    emit(FavouriteLoadingState());
    DioHelper.postData(
      url: !course.is_fav! ? 'removeFavorite' : 'addFavorite',
      data: {'course_id': course.id},
      token: userToken,
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['status']) {
        if (course.is_fav!) {
          if (!listOfFavourites.any((e) => e.id == course.id)) {
            listOfFavourites.add(course);
          }
        } else {
          if (listOfFavourites.any((e) => e.id == course.id)) {
            listOfFavourites.removeWhere((e) => e.id == course.id);
          }
        }
        if (coursesModel != null) {
          if (coursesModel!.data!.any((e) => e.id == course.id)) {
            coursesModel!.data!.firstWhere((e) => e.id == course.id).is_fav =
                course.is_fav;
          }
        }
        emit(FavouriteSuccessState());
      } else {
        emit(FavouriteErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(FavouriteErrorState(internetErrorMsg));
    });
  }

  void contactUs(Map data) async {
    emit(ContactLoadingState());
    DioHelper.postData(
      url: 'ContactUs/store',
      data: data,
    ).then((value) {
      if (value.data['status']) {
        emit(ContactSuccessState(value.data['message']));
      } else {
        emit(ContactErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ContactErrorState(internetErrorMsg));
    });
  }

  void aboutUS() async {
    emit(AboutLoadingState());
    DioHelper.getData(url: 'About-us/showAll').then((value) {
      if (value.data['status']) {
        emit(AboutSuccessState(value.data['data']));
      } else {
        emit(AboutErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(AboutErrorState(internetErrorMsg));
    });
  }

  void reserveCourse(Map data) async {
    emit(ResCourseLoadingState());
    DioHelper.postData(
      url: 'ContactwithCourses/store',
      data: data,
    ).then((value) {
      if (value.data['status']) {
        emit(ResCourseSuccessState(value.data['message']));
      } else {
        emit(ResCourseErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ResCourseErrorState(internetErrorMsg));
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
    } else if (tabsRouter.current.name == 'HomeTab' &&
        tabsRouter.activeIndex == index &&
        !tabsRouter.canPopSelfOrChildren) {
      emit(HomeScrollTopState());
    } else {
      tabsRouter.setActiveIndex(index);
    }
    // emit(LayoutChangeBottomNavState());
  }
}
