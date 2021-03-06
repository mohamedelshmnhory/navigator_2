import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:beautyapp/widgets/category_item.dart';
import 'package:beautyapp/widgets/images_slider.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:beautyapp/widgets/service_item.dart';
import 'package:beautyapp/widgets/social_accounts.dart';
import 'package:beautyapp/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LayoutCubit layoutCubit;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    layoutCubit = LayoutCubit.get(context)..getHome();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) =>
          state is HomeErrorState || state is HomeScrollTopState,
      buildWhen: (context, state) => state is HomeSuccessState,
      listener: (context, state) {
        if (state is HomeScrollTopState) {
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        }
        if (state is HomeErrorState) {
          internetAlert(() {
            layoutCubit.getHome();
          });
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            return layoutCubit.getHome();
          },
          child: layoutCubit.homeModel == null
              ? spinkit
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              builder: (context) => const VideoScreen(link: ''),
                              isScrollControlled: true,
                              useRootNavigator: true,
                              context: context);
                        },
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            shape: BoxShape.rectangle,
                          ),
                          child: const PhotoWidget(
                              photoLink: 'assets/temp/Group 19.png',
                              canOpen: false),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '??????????????',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      GridView.count(
                        // padding: const EdgeInsets.symmetric(horizontal: 12),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 5,
                        childAspectRatio: 100 / 100,
                        children: List.generate(
                          layoutCubit.homeModel!.data!.Category!.length,
                          (index) => GestureDetector(
                            onTap: () {
                              context.router.push(CoursesListScreen(
                                  id: layoutCubit
                                      .homeModel!.data!.Category![index].id!
                                      .toInt()));
                            },
                            child: CategoryItem(
                              // category: categories[index],
                              image: layoutCubit
                                  .homeModel!.data!.Category![index].image,
                              text: layoutCubit
                                  .homeModel!.data!.Category![index].name,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ImagesSlider(images: bannerImages),
                      const SizedBox(height: 10),
                      Text(
                        '??????????????',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              layoutCubit.homeModel!.data!.services!.length,
                          itemBuilder: (context, i) => InkWell(
                              onTap: () {
                                context.router.push(ServiceDetailsScreen(
                                    service: layoutCubit
                                        .homeModel!.data!.services![i]));
                              },
                              child: ServiceItem(
                                  service: layoutCubit
                                      .homeModel!.data!.services![i]))),
                      const SizedBox(height: 10),
                      Text(
                        '???????? ?????????????? ??????????????????',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 130,
                        child: GridView.count(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          childAspectRatio: 100 / 80,
                          children: List.generate(
                            layoutCubit.homeModel!.data!.instructors!.length,
                            (index) => InkWell(
                                onTap: () {
                                  context.pushRoute(TrainerDetailsScreen(
                                      trainer: layoutCubit.homeModel!.data!
                                          .instructors![index]));
                                },
                                child: CategoryItem(
                                    text: layoutCubit.homeModel!.data!
                                        .instructors![index].name,
                                    image: layoutCubit.homeModel!.data!
                                        .instructors![index].image,
                                    size: 100)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '??????????????????',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              context.pushRoute(CompetitionsListScreen(
                                  title: '?????????????????? ????????????????'));
                            },
                            child: CategoryItem(
                              category: Category(
                                image:
                                    'https://images.unsplash.com/photo-1567345492986-12e7f1dead72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                name: '?????????????????? ????????????????',
                              ),
                              size: 130,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.pushRoute(CompetitionsListScreen(
                                  title: '?????????????????? ??????????????'));
                            },
                            child: CategoryItem(
                              category: Category(
                                image:
                                    'https://images.unsplash.com/photo-1567345492986-12e7f1dead72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                                name: '?????????????????? ??????????????',
                              ),
                              size: 130,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '???????? ????????????',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      const ImagesSlider(images: offers),
                      const SizedBox(height: 10),
                      Text(
                        '???????????? ??????????????????',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 130,
                        child: GridView.count(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          childAspectRatio: 100 / 80,
                          children: List.generate(
                            trainers.length,
                            (index) => CategoryItem(
                                category: students[index], size: 100),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SocialAccounts(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
          color: mainColor,
          displacement: 20,
        );
      },
    );
  }
}

// class Categories extends StatelessWidget {
//   const Categories({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           alignment: Alignment.centerLeft,
//           children: [
//             SizedBox(
//               width: double.infinity,
//               child: Text(
//                 '??????????????',
//                 style: Theme.of(context).textTheme.headline5,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 10),
//             //   child: defaultTextButton(
//             //       function: () {}, text: '???????? ??????????????', textColor: primary),
//             // ),
//           ],.
//         ),
//         const SizedBox(height: 5),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(),
//             child: SizedBox(
//               height: 90,
//               // width: SizeConfig.screenWidth! + categories.length * 20,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Wrap(
//                     crossAxisAlignment: WrapCrossAlignment.start,
//                     alignment: WrapAlignment.start,
//                     // direction: Axis.vertical,
//                     children: [
//                       ...List.generate(
//                           (HomeScreen.categories.length / 2).round(),
//                           (index) => GestureDetector(
//                                 onTap: () {
//                                   navigateTo(
//                                       context,
//                                       CoursesListScreen(
//                                           title: HomeScreen.categories[index]));
//                                 },
//                                 child: Container(
//                                   margin: const EdgeInsets.all(5),
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 8),
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: mainColor, width: 1),
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: Text(
//                                     HomeScreen.categories[index],
//                                     style:
//                                         Theme.of(context).textTheme.headline3,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.center,
//                                     textDirection: TextDirection.rtl,
//                                   ),
//                                 ),
//                               ))
//                     ],
//                   ),
//                   Wrap(
//                     crossAxisAlignment: WrapCrossAlignment.start,
//                     alignment: WrapAlignment.start,
//                     // direction: Axis.vertical,
//                     children: [
//                       ...List.generate(
//                           HomeScreen.categories.length ~/ 2,
//                           (index) => GestureDetector(
//                                 onTap: () {
//                                   navigateTo(
//                                       context,
//                                       CoursesListScreen(
//                                           title: HomeScreen.categories[index +
//                                               (HomeScreen.categories.length / 2)
//                                                   .round()]));
//                                 },
//                                 child: Container(
//                                   margin: const EdgeInsets.all(5),
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 8),
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: mainColor, width: 1),
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: Text(
//                                     HomeScreen.categories[index +
//                                         (HomeScreen.categories.length / 2)
//                                             .round()],
//                                     style:
//                                         Theme.of(context).textTheme.headline3,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.center,
//                                     textDirection: TextDirection.rtl,
//                                   ),
//                                 ),
//                               ))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
