import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  bool obscureText;
  IconButton suffixIcon;
  String hintText;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  CustomTextField({
    Key? key,
    this.obscureText = false,
    required this.suffixIcon,
    required this.hintText,
    required this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(),
          errorBorder:  const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kSecondaryTextColor)
          ),
          focusedBorder:  const OutlineInputBorder(borderSide: BorderSide(color: AppColors.kSignInColor),
          ),
      ),

    );
  }
}
