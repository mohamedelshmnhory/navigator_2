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
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: vSpace(5)),
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
                    controller: subjectController,
                    type: TextInputType.text,
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
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            child: BuildCondition(
              condition: true,
              builder: (context) => defaultButton(
                function: () {
                  if (formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                text: 'إرسال',
                background: mainColor,
                textColor: Colors.white,
              ),
              fallback: (context) => spinkit,
            ),
          ),
          SizedBox(height: vSpace(1)),
        ],
      ),
    );
  }
}
