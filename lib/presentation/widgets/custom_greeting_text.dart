import 'package:flutter/material.dart';
import '../utilities/app_colors.dart';
import '../utilities/app_string.dart';

// ignore: must_be_immutable
class CustomGreetingText extends StatelessWidget {
  String title;

  CustomGreetingText({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: AppColors.kSignInColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: AppString.fontFamilyStyle
      ),
    );
  }
}
