import 'package:beautyapp/modules/auth/cubit/cubit.dart';
import 'package:beautyapp/modules/auth/cubit/states.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    var user = BlocProvider.of<AuthCubit>(context).loginModel!.data!.user;
    nameController.text = user!.name!;
    emailController.text = user.email!;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: buildAppBar(context, 'تحديث الملف الشخصي'),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: vSpace(5)),
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
                    prefix: Icons.person,
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
                    prefix: Icons.email,
                  ),
                  SizedBox(height: vSpace(3)),
                  BlocConsumer<AuthCubit, AuthStates>(
                    listener: (context, state) {
                      if (state is EditProfileSuccessState) {
                        if (state.loginModel.status!) {
                          context.router.pop();
                        }
                      }
                      if (state is EditProfileErrorState) {
                        showSnack(text: state.error!, state: SnackStates.ERROR);
                      }
                    },
                    builder: (context, state) {
                      return BuildCondition(
                        condition: state is! EditProfileLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.get(context).updateProfile(
                                data: {
                                  'name': nameController.text,
                                  'email': emailController.text,
                                },
                              );
                            } else {
                              showSnack(
                                  text: completeFields,
                                  state: SnackStates.WARNING);
                            }
                          },
                          text: 'حفظ',
                          background: mainColor,
                          textColor: Colors.white,
                        ),
                        fallback: (context) => spinkit,
                      );
                    },
                  ),
                  // SizedBox(height: vSpace(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
