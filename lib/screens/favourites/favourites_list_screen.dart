import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:beautyapp/widgets/course_list_item.dart';
import 'package:beautyapp/widgets/empty_list_replacement.dart';
import 'package:beautyapp/widgets/should_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auto_route/auto_route.dart';

class FavouritesListScreen extends StatefulWidget {
  const FavouritesListScreen({Key? key}) : super(key: key);

  @override
  _FavouritesListScreenState createState() => _FavouritesListScreenState();
}

class _FavouritesListScreenState extends State<FavouritesListScreen> {
  late LayoutCubit layoutCubit;

  @override
  void initState() {
    layoutCubit = LayoutCubit.get(context)..getFavouriteCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShouldLogin(
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listenWhen: (context, state) => state is FavouriteErrorState,
        buildWhen: (context, state) => state is FavouriteSuccessState,
        listener: (context, state) {
          if (state is FavouriteErrorState) {
            if (state.error == internetErrorMsg) {
              internetAlert(() {
                layoutCubit.getFavouriteCourses();
              });
            }
          }
        },
        builder: (context, state) {
          return layoutCubit.favouriteCoursesModel == null
              ? buildLoading
              : layoutCubit.listOfFavourites.isEmpty
                  ? const EmptyListReplacement(text: 'لا يوجد عناصر')
                  : RefreshIndicator(
                      onRefresh: () async {
                        return layoutCubit.getFavouriteCourses();
                      },
                      child: ListView.builder(
                          // physics: const BouncingScrollPhysics(),
                          itemCount: layoutCubit.listOfFavourites.length,
                          itemBuilder: (context, i) => GestureDetector(
                              onTap: () {
                                int id =
                                    layoutCubit.listOfFavourites[i].id!.toInt();
                                context.router
                                    .push(CourseDetailsScreen(id: id));
                              },
                              child: CourseListItem(
                                  key: Key(layoutCubit.listOfFavourites[i].id
                                      .toString()),
                                  course: layoutCubit.listOfFavourites[i]))),
                      color: mainColor,
                    );
        },
      ),
    );
  }

  Center get buildLoading {
    return const Center(
      child: SpinKitPumpingHeart(
        color: mainColor,
        size: 70.0,
        duration: Duration(milliseconds: 800),
      ),
    );
  }
}
