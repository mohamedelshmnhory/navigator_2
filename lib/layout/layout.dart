import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:beautyapp/widgets/navigation_icon.dart';
import 'package:beautyapp/widgets/social_accounts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'drawer.dart';
import 'taps_name.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

class Taps {
  static const int home = 0;
  static const int favourites = 1;
  static const int myCourses = 2;
  static const int search = 3;
  static const int profile = 4;
  static const int notifications = 5;
  static const int courses = 6;
  static const int endorsements = 7;
  static const int trainers = 8;
  static const int exams = 9;
  static const int services = 10;
  static const int about = 11;
  static const int contact = 12;
  static const int share = 13;
  static const int logout = 14;
}

const List<String> navItems = [
  'الرئيسية',
  'المفضلة',
  'تدريباتي',
  'البحث',
  'البروفايل',
  'الاشعارات',
  'دوراتنا',
  'الاعتمادات',
  'الخبراء',
  'الإختبارات',
  'الخدمات',
  'قالو عنا',
  'اتصل بنا',
  'مشاركة',
  'تسجيل الخروج',
];

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with TickerProviderStateMixin {
  late LayoutCubit layoutCubit;

  @override
  void initState() {
    // getIt.registerSingleton<LayoutCubit>(LayoutCubit.get(context),
    //     signalsReady: true);
    layoutCubit = LayoutCubit.get(context);
    initAnimation();
    super.initState();
  }

  void initAnimation() {
    layoutCubit.animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    layoutCubit.menuButton = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    layoutCubit.dispose();
    // getIt.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // SizeConfig().init(context);
    return BlocProvider.value(
      value: layoutCubit,
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        buildWhen: (context, state) => state is LayoutChangeBottomNavState,
        listenWhen: (context, state) => state is LayoutChangeBottomNavState,
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              color: Colors.white,
              child: AnimatedBuilder(
                  animation: layoutCubit.animationController,
                  builder: (context, snapshot) {
                    double scale =
                        .8 + .2 * (1 - layoutCubit.animationController.value);
                    // double scaleSmall =
                    //     .7 + .3 * (1 - layoutCubit.animationController.value);
                    double reverse = -1;
                    return Stack(
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 0),
                          child: Container(
                            height: SizeConfig.screenHeight,
                            width: SizeConfig.screenWidth,
                            color: Colors.blueGrey.withOpacity(.3),
                            child: Column(
                              children: const [
                                Expanded(
                                    child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SafeArea(
                                    child: SocialAccounts(),
                                  ),
                                )),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                        // Opacity(
                        //   opacity: .3,
                        //   child: buildAnimationBody(
                        //       scaleSmall, size, 130, reverse),
                        // ),
                        buildAnimationBody(
                            scale, SizeConfig.size!, 80, reverse),
                        Transform.translate(
                            offset: Offset(
                                -SizeConfig.size!.width *
                                    (1 -
                                        layoutCubit.animationController.value) *
                                    reverse,
                                0),
                            child: AppDrawer(
                              cubit: layoutCubit,
                              items: navItems,
                            )),
                      ],
                    );
                  }),
            ),
          );
        },
      ),
    );
  }

  // Scaffold buildScaffold(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.transparent,
  //       automaticallyImplyLeading: false,
  //       leading: IconButton(
  //           onPressed: () {
  //             layoutCubit.openCloseDrawer(context);
  //           },
  //           icon: AnimatedIcon(
  //               progress: layoutCubit.menuButton,
  //               icon: AnimatedIcons.menu_close)),
  //       actions: [
  //         IconButton(
  //             onPressed: () {
  //               layoutCubit.changeBottom(5);
  //             },
  //             icon: Icon(layoutCubit.currentIndex == 5
  //                 ? Icons.notifications
  //                 : Icons.notifications_outlined))
  //       ],
  //       title: Text(
  //         navItems[layoutCubit.currentIndex],
  //         style: Theme.of(context).textTheme.headline5,
  //       ),
  //     ),
  //     body: layoutCubit.bottomScreens[layoutCubit.currentIndex],
  //     bottomNavigationBar: BottomAppBar(
  //       elevation: 10,
  //       shape: const AutomaticNotchedShape(
  //         RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(20),
  //             topRight: Radius.circular(20),
  //           ),
  //         ),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.max,
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             NavigationIcon(
  //               navItems: navItems,
  //               cubit: layoutCubit,
  //               index: Taps.home,
  //               icon: 'assets/images/Icon material-featured-play-list.png',
  //               filledIcon:
  //                   'assets/images/Icon material-featured-play-list-1.png',
  //             ),
  //             NavigationIcon(
  //               navItems: navItems,
  //               cubit: layoutCubit,
  //               index: Taps.favourites,
  //               icon: 'assets/images/Icon awesome-heart-1.png',
  //               filledIcon: 'assets/images/Icon awesome-heart.png',
  //             ),
  //             NavigationIcon(
  //               navItems: navItems,
  //               cubit: layoutCubit,
  //               index: Taps.myCourses,
  //               icon: 'assets/images/Icon awesome-user-edit-1.png',
  //               filledIcon: 'assets/images/Icon awesome-user-edit.png',
  //             ),
  //             NavigationIcon(
  //               navItems: navItems,
  //               cubit: layoutCubit,
  //               index: Taps.search,
  //               icon: 'assets/images/Shape -1.png',
  //               filledIcon: 'assets/images/Shape 541.png',
  //             ),
  //             NavigationIcon(
  //               navItems: navItems,
  //               cubit: layoutCubit,
  //               index: Taps.profile,
  //               icon: 'assets/images/Group 14.png',
  //               filledIcon: 'assets/images/Group 17.png',
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  AutoTabsScaffold buildScaffold(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                layoutCubit.openCloseDrawer(context);
              },
              icon: AnimatedIcon(
                  progress: layoutCubit.menuButton,
                  icon: AnimatedIcons.menu_close)),
          actions: [
            IconButton(
                onPressed: () {
                  // layoutCubit.changeBottom(5);
                  tabsRouter.setActiveIndex(5);
                },
                icon: Icon(layoutCubit.currentIndex == 5
                    ? Icons.notifications
                    : Icons.notifications_outlined)),
            const Directionality(
                textDirection: TextDirection.ltr, child: AutoBackButton()),
          ],
          title: Text(
            tapsName[tabsRouter.topRoute.name] ?? '',
            style: Theme.of(context).textTheme.headline5,
          ),
        );
        return AppBar(
          title: Text(tabsRouter.topRoute.name),
          leading: const AutoBackButton(),
        );
      },
      routes: const [
        HomeTab(),
        FavouriteTab(),
        MyCoursesTab(),
        SearchTab(),
        ProfileTab(),
        NotificationsTab(),
        CategoriesTab(),
        EndorsementsTab(),
        TrainersTab(),
        ExamsTab(),
        ServicesTab(),
        AboutTab(),
        ContactTab(),
      ],
      bottomNavigationBuilder: buildBottomNav,
    );
  }

  Widget buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
    final hideBottomNav = tabsRouter.topMatch.meta['hideBottomNavf'] == true;
    layoutCubit.tabsRouter = tabsRouter;
    return hideBottomNav
        ? const SizedBox.shrink()
        : BottomAppBar(
            elevation: 10,
            shape: const AutomaticNotchedShape(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavigationIcon(
                    navItems: navItems,
                    cubit: layoutCubit,
                    index: Taps.home,
                    icon: 'assets/images/Icon material-featured-play-list.png',
                    filledIcon:
                        'assets/images/Icon material-featured-play-list-1.png',
                  ),
                  NavigationIcon(
                    navItems: navItems,
                    cubit: layoutCubit,
                    index: Taps.favourites,
                    icon: 'assets/images/Icon awesome-heart-1.png',
                    filledIcon: 'assets/images/Icon awesome-heart.png',
                  ),
                  NavigationIcon(
                    navItems: navItems,
                    cubit: layoutCubit,
                    index: Taps.myCourses,
                    icon: 'assets/images/Icon awesome-user-edit-1.png',
                    filledIcon: 'assets/images/Icon awesome-user-edit.png',
                  ),
                  NavigationIcon(
                    navItems: navItems,
                    cubit: layoutCubit,
                    index: Taps.search,
                    icon: 'assets/images/Shape -1.png',
                    filledIcon: 'assets/images/Shape 541.png',
                  ),
                  NavigationIcon(
                    navItems: navItems,
                    cubit: layoutCubit,
                    index: Taps.profile,
                    icon: 'assets/images/Group 14.png',
                    filledIcon: 'assets/images/Group 17.png',
                  ),
                ],
              ),
            ),
          );

    // BottomNavigationBar(
    //         backgroundColor: Colors.white,
    //         unselectedItemColor: mainColor.withOpacity(.8),
    //         currentIndex:
    //             tabsRouter.activeIndex <= 4 ? tabsRouter.activeIndex : 0,
    //         onTap: tabsRouter.setActiveIndex,
    //         items: [
    //           BottomNavigationBarItem(
    //             icon: const Badge(
    //                 value: '', child: Icon(Icons.featured_play_list)),
    //             label: navItems[Taps.home],
    //           ),
    //           BottomNavigationBarItem(
    //             icon: const Icon(Icons.favorite),
    //             label: navItems[Taps.favourites],
    //           ),
    //           BottomNavigationBarItem(
    //             icon: const Icon(Icons.person_pin),
    //             label: navItems[Taps.myCourses],
    //           ),
    //           BottomNavigationBarItem(
    //             icon: const Icon(Icons.search),
    //             label: navItems[Taps.search],
    //           ),
    //           BottomNavigationBarItem(
    //             icon: const Icon(Icons.person),
    //             label: navItems[Taps.profile],
    //           ),
    //         ],
    //       );
  }

  Transform buildAnimationBody(
      double scale, Size size, double move, double revers) {
    return Transform(
        transform: Matrix4.identity()
          ..scale(scale, scale)
          ..translate((revers) *
              (size.width - move) *
              (layoutCubit.animationController.value)),
        alignment: FractionalOffset.center,
        // offset: Offset(
        //     (size.width - 100) * (animationController.value), 0),
        child: Stack(
          children: [
            WillPopScope(
              child: buildScaffold(context),
              onWillPop: () async {
                layoutCubit.openCloseDrawer(context);
                if (!layoutCubit.tabsRouter.isTopMost) {
                  layoutCubit.tabsRouter.navigateBack();
                  return true;
                } else {
                  return false;
                }
              },
            ),
            Visibility(
              visible: layoutCubit.animationController.isCompleted,
              child: GestureDetector(
                onTap: () {
                  layoutCubit.openCloseDrawer(context);
                },
                onPanUpdate: (details) {
                  // Swiping in right direction.
                  if (details.delta.dx > 0) {
                    layoutCubit.openCloseDrawer(context);
                  }

                  // Swiping in left direction.
                  if (details.delta.dx < 0) {
                    layoutCubit.openCloseDrawer(context);
                  }
                },
                child: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ));
  }
}
