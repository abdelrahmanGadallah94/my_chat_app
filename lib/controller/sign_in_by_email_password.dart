import 'package:chat_test/controller/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../presentation/utilities/app_colors.dart';
import '../presentation/utilities/app_string.dart';

Future signInByEmail(
    {required String email,
    required String password,
    required BuildContext context}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showSnackBar(
          context, AppString.noUserFound, AppColors.kSecondaryTextColor);
    } else if (e.code == 'wrong-password') {
      showSnackBar(
          context, AppString.wrongPassword, AppColors.kSecondaryTextColor);
    }
  }
}
