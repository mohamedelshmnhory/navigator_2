import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/network/local/cache_helper.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: imageOpacity,
      body: Container(
        decoration: authBoxDecoration,
        child: SizedBox.expand(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: vSpace(5)),
                      buildLogo,
                      SizedBox(height: vSpace(2)),
                      Text('لإنك رائعة تألقي وشاركي جمالك',
                          style: Theme.of(context).textTheme.headline4!),
                      SizedBox(height: vSpace(3)),
                      Text('تسجيل دخول',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 24)),
                      SizedBox(height: vSpace(3)),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        direction: TextDirection.ltr,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return emptyError;
                          }
                        },
                        label: 'البريد الالكتروني',
                        prefix: Icons.person,
                      ),
                      SizedBox(height: vSpace(2)),
                      defaultFormField(
                        controller: passwordController,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return emptyError;
                          }
                        },
                        label: 'كلمة المرور',
                        prefix: Icons.lock,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      SizedBox(height: vSpace(3)),
                      BlocConsumer<AuthCubit, AuthStates>(
                        listener: (context, state) {
                          if (state is LoginSuccessState) {
                            if (state.loginModel.status!) {
                              userToken = state.loginModel.data!.user!.token!;
                              CacheHelper.saveData(
                                      key: 'userToken', value: userToken)
                                  .then((value) {
                                context.router.replaceNamed('/layout');
                              });
                            }
                          }
                          if (state is LoginErrorState) {
                            showSnack(
                                text: state.error!, state: SnackStates.ERROR);
                          }
                        },
                        builder: (context, state) {
                          return BuildCondition(
                            condition: state is! LoginLoadingState,
                            builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  AuthCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                } else {
                                  // showSnack(
                                  //     text: completeFields,
                                  //     state: SnackStates.WARNING);
                                }
                              },
                              text: 'دخول',
                              background: mainColor,
                              textColor: Colors.white,
                            ),
                            fallback: (context) => spinkit,
                          );
                        },
                      ),
                      SizedBox(height: vSpace(1)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defaultTextButton(
                            function: () {
                              // navigateTo(context, const PhoneResetScreen());
                            },
                            text: 'هل نسيت كلمة المرور؟',
                            textColor: Colors.redAccent,
                            size: getFontSize(4),
                          ),
                          defaultTextButton(
                            function: () {
                              context.router.push(const RegisterScreen());
                            },
                            text: 'مستخدم جديد',
                            textColor: mainColor,
                            size: getFontSize(4),
                          ),
                        ],
                      ),
                      SizedBox(height: vSpace(5)),
                      GestureDetector(
                        onTap: () => context.router.replaceNamed('/layout'),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
