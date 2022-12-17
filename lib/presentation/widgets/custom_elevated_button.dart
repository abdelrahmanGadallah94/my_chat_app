import 'package:flutter/material.dart';

import '../utilities/app_string.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  Color color;
  Color textColor;
  Function() onTap;
   CustomElevatedButton({Key? key,required this.text,required this.color,required this.textColor,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: AppString.fontFamilyStyle,
          ),
        ),
      ),
    );
  }
}
