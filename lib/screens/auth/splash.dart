import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/components/image_paths.dart';
import 'package:beautyapp/shared/network/local/cache_helper.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    context.router.replace(landing());
  }

  landing() {
    userToken = CacheHelper.getData(key: 'userToken') ?? '';
    if (userToken != '') {
      return const Layout();
    } else {
      return const Layout();
    }
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    navState = AutoRouter.of(context).navigatorKey;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    startTime();
  }

  // @override
  // Widget build(BuildContext context) {
  //   SizeConfig().init(context);
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: Lottie.asset(
  //       'assets/images/animation_splash_brada.json',
  //       height: SizeConfig.screenHeight,
  //       width: SizeConfig.screenWidth,
  //       onLoaded: (v) {
  //         navigationPage();
  //       },
  //       repeat: false,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(animation.value),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   mainAxisSize: MainAxisSize.min,
            //   children: <Widget>[
            //     Padding(
            //       padding: const EdgeInsets.only(bottom: 30.0),
            //       child: Image.asset(
            //         'assets/images/auth_background.png',
            //         height: 25.0,
            //         fit: BoxFit.scaleDown,
            //       ),
            //     )
            //   ],
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  getAssetImage(ImagePathName.logo),
                  width: animation.value * 250,
                  height: animation.value * 250,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
