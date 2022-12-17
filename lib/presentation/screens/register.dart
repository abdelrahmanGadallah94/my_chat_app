import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/register_by_email.dart';
import '../utilities/app_colors.dart';
import '../utilities/app_routes.dart';
import '../utilities/app_string.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_greeting_text.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscureText = true;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SizedBox(
        height: double.infinity,
        child: Image.asset(
          AppString.backgroundImageLink,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 14.h,
              ),
              CircleAvatar(
                radius: 50,
                child: Image.asset(
                  AppString.logoImageLink,
                ),
              ),
              SizedBox(height: 2.h),
              CustomGreetingText(title: AppString.register),
              SizedBox(height: 10.h),
              CustomTextField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return AppString.canNotEmpty;
                    }
                    return null;
                  },
                  hintText: AppString.name,
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.person))),
              SizedBox(height: 2.h),
              CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  validator: (data) {
                    if (data!.isEmpty) {
                      return AppString.canNotEmpty;
                    }
                    return null;
                  },
                  hintText: AppString.email,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.email_outlined))),
              SizedBox(height: 2.h),
              CustomTextField(
                onChanged: (data) {
                  password = data;
                },
                validator: (data) {
                  if (data!.isEmpty) {
                    return AppString.canNotEmpty;
                  }
                  return null;
                },
                obscureText: obscureText,
                hintText: AppString.password,
                suffixIcon: IconButton(
                    onPressed: () {
                      obscureText == true
                          ? obscureText = false
                          : obscureText = true;
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined)),
              ),
              SizedBox(height: 2.h),
              CustomElevatedButton(
                  color: AppColors.kSignInColor,
                  text: AppString.signUp,
                  textColor: AppColors.kWhiteColor,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await registerByEmail(context: context, email: email!, password: password!);
                      Navigator.pushNamed(context, AppRoutes.chatPage,arguments: email);
                    }
                  }),
              CustomTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.loginPage);
                },
                text1: AppString.haveAnAccount,
                text2: AppString.signIn,
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
