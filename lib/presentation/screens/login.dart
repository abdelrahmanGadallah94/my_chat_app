import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../controller/anonymous_signIn.dart';
import '../../controller/sign_in_by_email_password.dart';
import '../components/auth_buttons.dart';
import '../utilities/app_colors.dart';
import '../utilities/app_string.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_greeting_text.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';
import '../utilities/app_routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscure = true;
  GlobalKey<FormState> formKey = GlobalKey();
  String ?email;
  String ?password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Image.asset(
              AppString.backgroundImageLink,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
                  CustomGreetingText(title: AppString.login),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    onChanged: (data){
                      email = data;
                    },
                      validator: (data){
                        if(data!.isEmpty){
                          return AppString.canNotEmpty;
                        }
                        return null;
                      },
                      hintText: AppString.email,
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.email_outlined),
                      ),
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    onChanged: (data){
                      password = data;
                    },
                    validator: (data){
                      if(data!.isEmpty){
                        return AppString.canNotEmpty;
                      }
                      return null;
                    },
                    obscureText: obscure,
                    hintText: AppString.password,
                    suffixIcon: IconButton(
                        onPressed: () {
                          obscure == true ? obscure = false : obscure = true;
                          setState(() {

                          },
                          );
                        },
                        icon: const Icon(Icons.remove_red_eye_outlined)),
                  ),
                  SizedBox(height: 2.h),
                  CustomElevatedButton(
                      color: AppColors.kSignInColor,
                      text: AppString.signIn,
                      textColor: AppColors.kWhiteColor,
                      onTap: () async{
                        if(formKey.currentState!.validate()){
                          await signInByEmail(context: context,email: email!,password: password!);
                          Navigator.pushNamed(context, AppRoutes.chatPage,arguments: email);
                        }
                      },
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pop(context,);
                    },
                    text1: AppString.haveNoAccount,
                    text2: AppString.signUp,
                  ),
                  const AuthButtons(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () async{
                        await anonymousSignIn(context);
                        Navigator.pushNamed(context, AppRoutes.chatPage);
                      }, icon:  Icon(Icons.person,color: AppColors.kSecondaryTextColor,size: 25.sp,)),
                      Text(AppString.anonymous,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
