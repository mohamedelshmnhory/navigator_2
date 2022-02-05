import 'package:beautyapp/models/user_model.dart';
import 'package:beautyapp/screens/auth/cubit/cubit.dart';
import 'package:beautyapp/screens/auth/cubit/states.dart';
import 'package:auto_route/auto_route.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:beautyapp/widgets/photo_widget.dart';
import 'package:beautyapp/widgets/should_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget  {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>    {
  UserModel? _userModel;

  @override
  void initState() {
    super.initState();
    AuthCubit.get(context).getProfile();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is ProfileSuccessState) {
          _userModel = state.loginModel;
        }
        if (state is EditProfileSuccessState) {
          _userModel = state.loginModel;
        }
        if (state is ProfileErrorState) {
          internetAlert(() {
            AuthCubit.get(context).getProfile();
          });
        }
      },
      builder: (context, state) {
        return ShouldLogin(
            child: _userModel == null
                ? spinkit
                : SingleChildScrollView(
                    child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: vSpace(2),
                        ),
                        Container(
                            height: 100,
                            clipBehavior: Clip.hardEdge,
                            child: const PhotoWidget(
                                photoLink:
                                    'https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80'),
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle)),
                        SizedBox(height: vSpace(1)),
                        Text(
                          _userModel!.data!.user!.name!,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          _userModel!.data!.user!.email!,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ProfileButton(
                          icon: 'assets/images/Group 86.png',
                          text: 'تحديث الملف الشخصي',
                          onPress: () {
                            context.router.push(const EditProfile());
                          },
                        ),
                        ProfileButton(
                          icon: 'assets/images/Group 87.png',
                          text: 'الإتصال بالدعم',
                          onPress: () {},
                        ),
                        ProfileButton(
                          icon: 'assets/images/Group 88.png',
                          text: 'خروج',
                          onPress: () {},
                        ),
                      ],
                    ),
                  )));
      },
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function onPress;
  const ProfileButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: blue),
          boxShadow: [
            BoxShadow(
                offset: const Offset(.1, .2),
                blurRadius: 3,
                spreadRadius: .1,
                color: Colors.blue.withOpacity(.5))
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(icon, height: 25),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
      ),
    );
  }
}
