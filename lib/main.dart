import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'presentation/screens/home.dart';
import 'presentation/screens/chat.dart';
import 'presentation/screens/login.dart';
import 'presentation/screens/register.dart';
import 'presentation/utilities/app_routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget{
  const ChatApp({super.key});

  @override
  Widget build (BuildContext context){
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.homePage: (context) => const Home(),
          AppRoutes.registerPage: (context) => const Register(),
          AppRoutes.loginPage: (context) => const Login(),
          AppRoutes.chatPage: (context) => const Chat(),
        },
        initialRoute: AppRoutes.homePage,
      ),
    );
  }
}

