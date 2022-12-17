import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../presentation/utilities/app_colors.dart';
import '../presentation/utilities/app_string.dart';
import 'snack_bar.dart';

Future anonymousSignIn(BuildContext context) async{
  try {
    final userCredential =
    await FirebaseAuth.instance.signInAnonymously();
    CollectionReference users = FirebaseFirestore.instance.collection(AppString.users);
    return users.add({
      AppString.email: AppString.anonymous,
      AppString.password: AppString.anonymous,
    });
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        showSnackBar(context, "Anonymous auth hasn't been enabled for this project.", AppColors.kSignInColor);
        break;
      default:
        showSnackBar(context, "Unkown Error.", AppColors.kSignInColor);
    }
  }
}