import 'package:flutter/material.dart';

import '../presentation/utilities/app_colors.dart';
void showSnackBar(context,String errorMessage,snackBarColor){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: snackBarColor,
      content: Text(
          errorMessage,
        textAlign: TextAlign.center,
      ),
    ),
  );
}