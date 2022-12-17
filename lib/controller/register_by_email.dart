import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../presentation/utilities/app_colors.dart';
import '../presentation/utilities/app_string.dart';
import 'snack_bar.dart';

Future registerByEmail({required String email,required String password,required BuildContext context})async{
  FirebaseAuth auth = FirebaseAuth.instance;

  try{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    CollectionReference users = FirebaseFirestore.instance.collection(AppString.users);
    return users.add({
      AppString.email: email,
      AppString.password: password,
    });
  }on FirebaseAuthException catch(e){
    if(e.code == 'weak-password'){
      showSnackBar(context, AppString.weakPassword,AppColors.kSecondaryTextColor);
    }else if (e.code == 'email-already-in-use'){
      showSnackBar(context, AppString.emailIsUsed,AppColors.kSecondaryTextColor);
    }
  }
}