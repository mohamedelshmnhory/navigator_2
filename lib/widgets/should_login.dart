import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ShouldLogin extends StatelessWidget {
  final Widget? child;
  const ShouldLogin({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userToken == ''
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'سجل دخول أولًا',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                    color: mainColor,
                  ),
                ),
                const SizedBox(height: 20),
                defaultButton(
                  function: () {
                    context.router.replace(const LoginScreen());
                  },
                  text: 'تسجيل الدخول',
                  background: mainColor,
                  textColor: Colors.white,
                  width: 200,
                ),
              ],
            ),
          )
        : child!;
  }
}

Future<dynamic> showLoginDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) => const Dialog(
            backgroundColor: accent,
            child: SizedBox(height: 200, child: ShouldLogin()),
          ));
}
