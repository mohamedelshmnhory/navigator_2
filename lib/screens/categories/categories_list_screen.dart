import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
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
  late LayoutCubit layoutCubit;
  @override
  void initState() {
    layoutCubit = LayoutCubit.get(context)..getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) => state is CategoriesErrorState,
      buildWhen: (context, state) => state is CategoriesSuccessState,
      listener: (context, state) {
        if (state is CategoriesErrorState) {
          internetAlert(() {
            layoutCubit.getCategories();
          });
        }
      },
      builder: (context, state) {
        return layoutCubit.categoriesModel == null
            ? spinkit
            : GridView.count(
                // padding: const EdgeInsets.symmetric(horizontal: 12),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 5,
                childAspectRatio: 100 / 100,
                children: List.generate(
                  layoutCubit.categoriesModel!.data!.length,
                  (index) => GestureDetector(
                    onTap: () {
                      int id = layoutCubit.homeModel!.data!.Category![index].id!
                          .toInt();
                      context.router.push(CoursesListScreen(id: id));
                    },
                    child: CategoryItem(
                      // category: categories[index],
                      image: layoutCubit.categoriesModel!.data![index].image,
                      text: layoutCubit.categoriesModel!.data![index].name,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
