import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/layout/layout.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/components/image_paths.dart';
import 'package:beautyapp/shared/network/local/cache_helper.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/share_app.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:beautyapp/widgets/should_login.dart';
import 'package:flutter/material.dart';

import 'cubit/cubit.dart';

class AppDrawer extends StatelessWidget {
  final LayoutCubit cubit;
  final List<String> items;

  const AppDrawer({
    Key? key,
    required this.cubit,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        width: size.width - 130,
        padding: const EdgeInsets.only(right: 20, bottom: 70),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: vSpace(9)),
              Image.asset(
                'assets/images/logo.png',
                height: vSpace(10),
              ),
              const SizedBox(height: 30),
              DrawerButton(
                  icon: getAssetImage(ImagePathName.cert),
                  cubit: cubit,
                  item: items[Taps.courses],
                  onTap: () {
                    cubit.changeBottom(Taps.courses);
                  }),
              DrawerButton(
                  icon: getAssetImage(ImagePathName.cert),
                  cubit: cubit,
                  item: items[Taps.endorsements],
                  onTap: () {
                    cubit.changeBottom(Taps.endorsements);
                  }),
              DrawerButton(
                  icon: getAssetImage(ImagePathName.cert),
                  cubit: cubit,
                  item: items[Taps.trainers],
                  onTap: () {
                    cubit.changeBottom(Taps.trainers);
                  }),
              DrawerButton(
                  icon: getAssetImage(ImagePathName.cert),
                  cubit: cubit,
                  item: items[Taps.exams],
                  onTap: () {
                    cubit.changeBottom(Taps.exams);
                  }),
              DrawerButton(
                  icon: getAssetImage(ImagePathName.cert),
                  cubit: cubit,
                  item: items[Taps.services],
                  onTap: () {
                    cubit.changeBottom(Taps.services);
                  }),
              DrawerButton(
                  token: false,
                  icon: getAssetImage(ImagePathName.about),
                  cubit: cubit,
                  item: items[Taps.about],
                  onTap: () {
                    cubit.changeBottom(Taps.about);
                  }),
              DrawerButton(
                  icon: getAssetImage(ImagePathName.contact),
                  cubit: cubit,
                  item: items[Taps.contact],
                  onTap: () {
                    cubit.changeBottom(Taps.contact);
                  }),
              DrawerButton(
                  token: false,
                  icon: getAssetImage(ImagePathName.share),
                  cubit: cubit,
                  item: items[Taps.share],
                  onTap: () {
                    ShareApp.share();
                  }),
              DrawerButton(
                  icon: getAssetImage(ImagePathName.logout),
                  cubit: cubit,
                  item: items[Taps.logout],
                  onTap: () {
                    userToken = '';
                    CacheHelper.removeData(
                      key: 'userToken',
                    ).then((value) {
                      if (value) {
                        cubit.changeBottom(Taps.home);
                        context.router.replace(const LoginScreen());
                      }
                    });
                  }),
              // const SizedBox(height: 10),
              // const Divider(color: Colors.white, thickness: 1.5),
              // const SizedBox(height: 20),
              // Center(
              //   child: SizedBox(
              //     height: 20,
              //     child: ListView.separated(
              //       shrinkWrap: true,
              //       padding: const EdgeInsets.symmetric(horizontal: 15),
              //       physics: const NeverScrollableScrollPhysics(),
              //       scrollDirection: Axis.horizontal,
              //       itemCount: socialIcons.length,
              //       itemBuilder: (context, i) => Image.asset(socialIcons[i].icon),
              //       separatorBuilder: (BuildContext context, int index) =>
              //           const SizedBox(width: 7),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key? key,
    required this.cubit,
    required this.item,
    required this.onTap,
    required this.icon,
    this.token = true,
  }) : super(key: key);

  final LayoutCubit cubit;
  final String item;
  final VoidCallback onTap;
  final String icon;
  final bool token;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (userToken != '' || !token) {
          LayoutCubit.get(context).openCloseDrawer(context);
          onTap();
        } else {
          showLoginDialog(context);
        }
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Text(
              item,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontSize: 16, color: mainColor),
            ),
          ),
          Divider(
            color: mainColor.withOpacity(.5),
            thickness: 1,
            height: 8,
          ),
        ],
      ),
    );
  }
}
