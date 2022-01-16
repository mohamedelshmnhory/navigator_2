import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';

// mock auth state

var isAuthenticated = true;

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {

    if (userToken == '') {
      // ignore: unawaited_futures
      // router.push(const LoginScreen()
      //     // LoginScreen(onLoginResult: (_) {
      //     //   isAuthenticated = true;
      //     //   // we can't pop the bottom page in the navigator's stack
      //     //   // so we just remove it from our local stack
      //     //   resolver.next();
      //     //   router.removeLast();
      //     // }),
      //     );
      resolver.next(true);
    } else {
      resolver.next(true);
    }
  }
}

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}
