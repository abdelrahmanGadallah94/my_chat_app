import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';
import '../utilities/app_string.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  String text1;
  String text2;
  Function() onPressed;
   CustomTextButton({Key? key,required this.text1,required this.text2,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: onPressed, icon: Text(
        text1,
      style: const TextStyle(color: AppColors.kSecondaryTextColor,fontSize: 18,fontWeight: FontWeight.bold),
    ), label:  Text(text2,style: const TextStyle(color: AppColors.kWhiteColor)));
  }
}
