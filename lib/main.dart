import 'package:beautyapp/routes/auth_guard.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/cubit/cubit.dart';
import 'modules/auth/cubit/cubit.dart';
import 'routes/route_observer.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(MyApp());
}

// flutter build apk --split-per-abi
// flutter pub run build_runner build --delete-conflicting-outputs
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());
  final _observer = MyObserver();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp.router(
        title: 'beauty',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(
            // navigatorObservers: () => [_observer],
            ),
        builder: (context, router) => router!,
      ),
    );
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context) => LayoutCubit()),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'beauty',
    //     navigatorKey: navState,
    //     theme: lightTheme,
    //     home: const SplashScreen(),
    //   ),
    // );
  }
}
