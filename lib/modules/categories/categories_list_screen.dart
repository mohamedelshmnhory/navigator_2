import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/layout/layout.dart';
import 'package:beautyapp/modules/auth/splash.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({Key? key}) : super(key: key);

  @override
  _CategoriesListScreenState createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {

  @override
  void initState() {
    getIt<LayoutCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) => state is CategoriesSuccessState,
      buildWhen: (context, state) => state is CategoriesSuccessState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return getIt<LayoutCubit>().categoriesModel == null
            ? spinkit
            : GridView.count(
                // padding: const EdgeInsets.symmetric(horizontal: 12),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 5,
                childAspectRatio: 100 / 100,
                children: List.generate(
                  getIt<LayoutCubit>().categoriesModel!.data!.length,
                  (index) => GestureDetector(
                    onTap: () {
                      context.router.push(CoursesListScreen(
                          title: getIt<LayoutCubit>().categoriesModel!.data![index].name ?? ''));
                    },
                    child: CategoryItem(
                      // category: categories[index],
                      image: getIt<LayoutCubit>().categoriesModel!.data![index].image,
                      text: getIt<LayoutCubit>().categoriesModel!.data![index].name,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
