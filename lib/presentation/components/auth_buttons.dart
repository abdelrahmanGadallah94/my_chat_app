import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/sign_in_by_facebook.dart';
import '../../controller/sign_in_by_google.dart';
class AuthButtons extends StatelessWidget {
  const AuthButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GoogleAuthButton(
          onPressed: () async{
            await sigInByGoogle();
          },
          style: AuthButtonStyle(
            buttonType: AuthButtonType.icon,
          ),
        ),
        SizedBox(width: 3.w,),
        FacebookAuthButton(
          onPressed: ()async{
            await signInWithFacebook();
          },
          style: AuthButtonStyle(
            buttonType: AuthButtonType.icon,
          ),
        )
      ],
    );
  }
}
