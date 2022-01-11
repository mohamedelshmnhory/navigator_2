import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/models/categories_model.dart';
import 'package:beautyapp/models/home_model.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/network/end_points.dart';
import 'package:beautyapp/shared/network/remote/dio_helper.dart';
// import 'package:beautyapp/modules/about.dart';
// import 'package:beautyapp/modules/categories/categories_list_screen.dart';
// import 'package:beautyapp/modules/certifications_screen.dart';
// import 'package:beautyapp/modules/contact.dart';
// import 'package:beautyapp/modules/favourites_list/favourites_list_screen.dart';
// import 'package:beautyapp/modules/home/home_screen.dart';
// import 'package:beautyapp/modules/my_courses/my_courses_list_screen.dart';
// import 'package:beautyapp/modules/notifications.dart';
// import 'package:beautyapp/modules/profile/profile_screen.dart';
// import 'package:beautyapp/modules/search/search_screen.dart';
// import 'package:beautyapp/modules/services/services_list_screen.dart';
// import 'package:beautyapp/modules/trainers_list/trainers_list_screen.dart';
// import 'package:beautyapp/widgets/should_login.dart';
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
    DioHelper.getData(
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
      debugPrint(error);
      emit(HomeErrorState(internetErrorMsg));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() async {
    emit(CategoriesLoadingState());
    DioHelper.getData(
      url: CATEGORIES,
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
      debugPrint(error);
      emit(CategoriesErrorState(internetErrorMsg));
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
