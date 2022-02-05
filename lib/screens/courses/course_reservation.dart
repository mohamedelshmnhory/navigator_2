import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseReservation extends StatefulWidget {
  const CourseReservation(
      {Key? key, required this.courseId, required this.categoryId})
      : super(key: key);
  final int courseId;
  final int categoryId;

  @override
  State<CourseReservation> createState() => _CourseReservationState();
}

class _CourseReservationState extends State<CourseReservation> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: vSpace(3)),
            defaultFormField(
              controller: nameController,
              type: TextInputType.name,
              direction: TextDirection.ltr,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return emptyError;
                }
              },
              label: 'أكتب إسمك',
              prefix: null,
              prefixWidth: 0,
            ),
            SizedBox(height: vSpace(2)),
            defaultFormField(
              controller: phoneController,
              type: TextInputType.phone,
              direction: TextDirection.ltr,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return emptyError;
                }
              },
              label: 'إدخل تليفونك',
              prefix: null,
              prefixWidth: 0,
            ),
            SizedBox(height: vSpace(2)),
            defaultFormField(
              controller: emailController,
              type: TextInputType.emailAddress,
              direction: TextDirection.ltr,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return emptyError;
                }
              },
              label: 'إدخل إيميلك',
              prefix: null,
              prefixWidth: 0,
            ),
            SizedBox(height: vSpace(2)),
            defaultFormField(
              controller: messageController,
              type: TextInputType.multiline,
              inputAction: TextInputAction.newline,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return emptyError;
                }
              },
              label: 'إكتب رسالتك',
              prefix: null,
              min: 4,
              prefixWidth: 0,
            ),
            const SizedBox(height: 20),
            BlocConsumer<LayoutCubit, LayoutStates>(
              listenWhen: (context, state) =>
                  state is ResCourseSuccessState ||
                  state is ResCourseErrorState,
              buildWhen: (context, state) =>
                  state is ResCourseSuccessState ||
                  state is ResCourseLoadingState ||
                  state is ResCourseErrorState,
              listener: (context, state) {
                if (state is ResCourseSuccessState) {
                  messageController.clear();
                  nameController.clear();
                  phoneController.clear();
                  emailController.clear();
                  showSnack(text: state.msg ?? '', state: SnackStates.SUCCESS);
                } else if (state is ResCourseErrorState) {
                  showSnack(text: state.error ?? '');
                }
              },
              builder: (context, state) {
                return state is ResCourseLoadingState
                    ? spinkit
                    : BuildCondition(
                        condition: true,
                        builder: (context) => defaultButton(
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              LayoutCubit.get(context).reserveCourse({
                                'courses_id': widget.courseId,
                                'category_id': widget.categoryId,
                                'name': nameController.text,
                                'email': emailController.text,
                                'mobile': phoneController.text,
                                'message': messageController.text,
                              });
                            }
                          },
                          text: 'إرسال',
                          background: mainColor,
                          textColor: Colors.white,
                        ),
                        fallback: (context) => spinkit,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
