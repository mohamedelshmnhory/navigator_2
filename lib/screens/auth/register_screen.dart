import 'package:beautyapp/screens/auth/cubit/cubit.dart';
import 'package:beautyapp/screens/auth/cubit/states.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/network/local/cache_helper.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

enum Gender { male, female }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  int? genderId;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    passwordController2.dispose();
    emailController.dispose();
    nameController.dispose();
    // genderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      Text('مستخدم جديد',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 24)),
                      SizedBox(height: vSpace(1)),
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        direction: TextDirection.ltr,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return emptyError;
                          }
                        },
                        label: 'الاسم',
                        prefix: null,
                        prefixWidth: 0,
                      ),
                      SizedBox(height: vSpace(1)),
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
                        prefix: null,
                        prefixWidth: 0,
                      ),
                      SizedBox(height: vSpace(1)),
                      // buildDropdownMenu(
                      //   context: context,
                      //   controller: genderController,
                      //   label: 'النوع',
                      //   icon: null,
                      //   items: genderList
                      //       .map((e) => DropdownMenuItem(
                      //             child: Align(
                      //                 alignment: Alignment.centerRight,
                      //                 child: Text(e.text)),
                      //             value: e,
                      //           ))
                      //       .toList(),
                      //   onChange: (dynamic selectedValue) {
                      //     genderController.text = selectedValue.text;
                      //     genderId = selectedValue.id;
                      //   },
                      // ),
                      // SizedBox(height: vSpace(1)),
                      DropdownButtonFormField2(
                        decoration: const InputDecoration(
                          //Add isDense true and zero Padding.
                          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: .5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: .5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: .5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: .5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),

                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          //Add more decoration as you want here
                          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        ),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.5,
                            color: mainColor,
                          ),
                          color: Colors.white,
                        ),
                        isExpanded: true,
                        hint: const Text(
                          'النوع',
                          style: TextStyle(fontSize: 14),
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: mainColor,
                        ),
                        iconSize: 25,
                        buttonHeight: 50,
                        buttonPadding:
                            const EdgeInsets.only(left: 10, right: 20),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        items: [Gender.male, Gender.female]
                            .map((item) => DropdownMenuItem<Gender>(
                                  value: item,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    item.name == 'male' ? 'ذكر' : 'انثى',
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.start,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return '   ' + emptyError;
                          }
                        },
                        onChanged: (Gender? value) {
                          genderId = value!.index;
                        },
                        onSaved: (Gender? value) {
                          genderId = value!.index;
                        },
                      ),
                      SizedBox(height: vSpace(1)),
                      defaultFormField(
                        controller: passwordController,
                        validate: (String? value) {
                          if (value!.isEmpty ||
                              value != passwordController2.value.text) {
                            return emptyError;
                          }
                        },
                        label: 'كلمة المرور',
                        prefix: null,
                        prefixWidth: 0,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      SizedBox(height: vSpace(1)),
                      defaultFormField(
                        controller: passwordController2,
                        validate: (String? value) {
                          if (value!.isEmpty ||
                              value != passwordController.value.text) {
                            // return 'please enter the same password';
                            return emptyError;
                          }
                        },
                        label: 'تأكيد كلمة المرور',
                        prefix: null,
                        prefixWidth: 0,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      SizedBox(height: vSpace(3)),
                      BlocConsumer<AuthCubit, AuthStates>(
                        listener: (context, state) {
                          if (state is RegisterSuccessState) {
                            if (state.loginModel.status!) {
                              userToken = state.loginModel.data!.user!.token!;
                              CacheHelper.saveData(
                                      key: 'userToken', value: userToken)
                                  .then((value) {
                                // context.router.replace(const LayoutRoute());
                              });
                            }
                          }
                          if (state is RegisterErrorState) {
                            showSnack(
                                text: state.error!, state: SnackStates.ERROR);
                          }
                        },
                        builder: (context, state) {
                          return BuildCondition(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  AuthCubit.get(context).userRegister(
                                    data: {
                                      'name': nameController.text,
                                      'email': emailController.text,
                                      'password': passwordController.text,
                                      'password_confirmation':
                                          passwordController2.text,
                                    },
                                  );
                                } else {
                                  // showSnack(
                                  //     text: completeFields,
                                  //     state: SnackStates.WARNING);
                                }
                              },
                              text: 'تسجيل',
                              background: mainColor,
                              textColor: Colors.white,
                            ),
                            fallback: (context) => spinkit,
                          );
                        },
                      ),
                      SizedBox(height: vSpace(1)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultTextButton(
                            function: () {
                              // navigateTo(context, const PhoneResetScreen());
                            },
                            text: 'بالفعل لدي حساب؟',
                            textColor: Colors.black,
                            size: getFontSize(4),
                          ),
                          defaultTextButton(
                            function: () {
                              context.router.pop();
                            },
                            text: ' التسجيل من هنا',
                            textColor: mainColor,
                            size: getFontSize(4),
                          ),
                        ],
                      ),
                      // SizedBox(height: vSpace(20)),
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
