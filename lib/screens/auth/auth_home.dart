import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


class AuthHome extends StatelessWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: imageOpacity,
      body: Container(
        decoration: authBoxDecoration,
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: vSpace(5)),
                  buildLogo,
                  SizedBox(height: vSpace(2)),
                  Text('لإنك رائعة تألقي وشاركي جمالك',
                      style: Theme.of(context).textTheme.headline4!),
                  SizedBox(height: vSpace(4)),
                  Text(
                      'في تطبيق جمالك ستجدين كل ما\nتهتمين به من عامل الجمال والموضة',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5!),
                  const Spacer(),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: mainColor)),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: GestureDetector(
                         // onTap: () => context.router.navigate(const LoginScreenRoute()),
                          child: Container(
                            color: mainColor,
                            height: 50,
                            child: const Center(
                                child: Text(
                              'التسجيل',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.router.push(const Layout()),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  border: Border.all(color: mainColor)),
                              height: 50,
                              child: const Center(
                                child: Text(
                                  'تخطي التسجيل',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: vSpace(15)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
