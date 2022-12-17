import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utilities/app_colors.dart';
import '../utilities/app_routes.dart';
import '../utilities/app_string.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_greeting_text.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              AppString.homeImageLink,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                 SizedBox(height: 12.h,),
                CircleAvatar(
                  radius: 50,
                  child: Image.asset(
                    AppString.logoImageLink,
                  ),
                ),
                 SizedBox(height: 1.5.h),
                CustomGreetingText(title: AppString.greeting),
                 SizedBox(height: 32.h),
                CustomElevatedButton(
                  color: AppColors.kSignInColor,text: AppString.signIn,textColor: AppColors.kWhiteColor,
                    onTap: (){
                    Navigator.pushNamed(context, AppRoutes.loginPage);
                    }
                ),
                SizedBox(height: 2.h),
                CustomElevatedButton(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.registerPage);
                  },
                  color: AppColors.kWhiteColor,text: AppString.signUp,textColor: AppColors.kSignInColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
