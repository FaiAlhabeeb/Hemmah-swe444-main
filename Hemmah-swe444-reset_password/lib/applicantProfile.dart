import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hemmah/homepageapplicant.dart';
import 'package:hemmah/settingsApplicant.dart';

import 'GetDatafromCompony.dart';
import 'SettingsC.dart';

import 'package:firebase_auth/firebase_auth.dart';


class applicantProfile extends StatefulWidget {

  const applicantProfile ({super.key});


  @override
  State<applicantProfile> createState() => _applicantProfile();
}

class _applicantProfile extends State<applicantProfile> {
  final credintial = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
          backgroundColor: Color(0xFFF3E5F5),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF616161),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepageapplicant()));
              }),
          title: Text(
            ' Applicant Profile',
            style: TextStyle(
              fontFamily: ' Playfair Displa',
              color: Color(0xFF616161),
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 1.50,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Color(0xFF616161),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsApplicant()));
                }),
          ],
        ),

    );
  }
}
