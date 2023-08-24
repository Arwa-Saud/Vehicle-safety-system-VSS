import 'package:flutter/material.dart';
import 'ForgotPassword.dart';
import 'Profile.dart';
import 'home.dart';
import 'login.dart';
import 'register.dart';
import 'ِEmail.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'Email': (context) => MyApp(),
      'ForgotPassword': (context) => ForgotPassword(),
      'home': (context) => MyApp1(),
      'profile': (context) => MyApp2(),
    },
  ));
}
