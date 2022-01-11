import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/styles/colors.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: vSpace(5)),
              defaultFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
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
                controller: emailController,
                type: TextInputType.emailAddress,
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
                controller: emailController,
                type: TextInputType.emailAddress,
                direction: TextDirection.ltr,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return emptyError;
                  }
                },
                label: 'عنوان الموضوع',
                prefix: null,
                prefixWidth: 0,
              ),
              SizedBox(height: vSpace(2)),
              defaultFormField(
                controller: passwordController,
                type: TextInputType.multiline,
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
              SizedBox(height: vSpace(3)),
              BuildCondition(
                condition: true,
                builder: (context) => defaultButton(
                  function: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  text: 'إرسال',
                  background: mainColor,
                  textColor: Colors.white,
                ),
                fallback: (context) => spinkit,
              ),
              SizedBox(height: vSpace(1)),
            ],
          ),
        ),
      ),
    );
  }
}
