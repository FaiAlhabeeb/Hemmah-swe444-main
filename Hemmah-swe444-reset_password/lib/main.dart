import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hemmah/SettingsC.dart';
import 'package:hemmah/aboutus.dart';
import 'package:hemmah/signup.dart';
import 'package:hemmah/start.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hemmah/userchoice.dart';

import 'SignupAsApplicants.dart';
import 'aboutusApplicant.dart';
import 'applicantProfile.dart';
import 'change_password.dart';
import 'change_passwordA.dart';
import 'componyProfile.dart';
import 'homepage.dart';
import 'homepageapplicant.dart';
import 'login.dart';
import 'settingsApplicant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        '/': (context) => const Start(),
        '/login': (context) => Login(),
        "/signup": (context) => Signup(),
        "/userchoice": (context) => const userchoice(),
        "/SignupAsApplicants": (context) => SignupAsApplicants(),
        "/homepage": (context) => homepage(),
        "/homepageapplicant": (context) => homepageapplicant(),
        "/componyProfile": (context) => const componyProfile(),
        "/Settings": (context) => const SettingsC(),
        "/aboutus": (context) => const aboutus(),
        "/aboutusApplicant":(context) => const aboutusApplicant(),
        "/applicantProfile":(context) => const applicantProfile(),
        "/SettingsApplicant":(context) => const SettingsApplicant(),
        "/change_password":(context) => ChangePassword(),
        "/change_passwordA":(context) => ChangePasswordA(),

      },
    );
  }
}
