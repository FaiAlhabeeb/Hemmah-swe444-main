import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'GetDatafromCompony.dart';
import 'SettingsC.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'homepage.dart';

class componyProfile extends StatefulWidget {
  const componyProfile({super.key});

  @override
  State<componyProfile> createState() => _componyProfileState();
}

class _componyProfileState extends State<componyProfile> {
  final credintial = FirebaseAuth.instance.currentUser;
  var x= "";
  final dialogUsernameController=TextEditingController();
  CollectionReference users =  FirebaseFirestore.instance.collection('Compony');


myDialog(dynamic mykey){
return showDialog(
  
            context: context,
            builder: (BuildContext context) {
             
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11) ),
                child: Container(
                  padding: EdgeInsets.all(22),
                 
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                          controller: dialogUsernameController,
                          maxLength: 20,
                      
                          decoration: InputDecoration(
                 hintText: 
              ""
                      
                          ),
                      ),
                    
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                               
                        users.doc(credintial!.uid).update({mykey: dialogUsernameController.text});
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(fontSize: 17),
                              )),
                              TextButton(
                              onPressed: () {
                               // addnewtask();
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontSize: 17),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
           
          );
        }
        
          @override
      






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
                    MaterialPageRoute(builder: (context) => homepage()));
              }),
          title: Text(
            ' Company Profile',
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
                          builder: (context) => const SettingsC()));
                }),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 400),
                SizedBox(height: 40),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.grey.shade200,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg"),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.add_a_photo, color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                50,
                              ),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 4),
                                color: Colors.black.withOpacity(
                                  0.3,
                                ),
                                blurRadius: 3,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 320,
                  height: 105,
                  child: Stack(children: [
                    Positioned(
                      left: 20,
                      top: 0,
                      child: Text(
                        'Company Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 16,
                          fontFamily: 'Playfair Displa',
                          fontWeight: FontWeight.w700,
                          height: 1.88,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 45,
                      child: Container(
                        width: 320,
                        height: 60,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF4F4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 1,
                      top: 35,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: IconButton(
                          
                          onPressed:(){
                         myDialog('ComponyName');            
                          },
                            icon: Icon(Icons.edit)),
                            ),
                        ),
                      ),
                    
                    
                      

                    
                    
                    Positioned(
                      left: 30,
                      top: 60,
                      child: GetDatafromCompony(documentId: credintial!.uid)
                    ),
                  ]),
                ),
                /*  Container(
        width: 320,
        height: 105,
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 0,
              child: Text(
                'Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF585858),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.88,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 45,
              child: Container(
                width: 320,
                height: 60,
                decoration: ShapeDecoration(
                  color: Color(0xFFF4F4F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
             Positioned(
          bottom: 0,
          right: 1,
          top: 35,

          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(Icons.edit, color: Colors.black),
            ),
          ),
             ),
            Positioned(
              left: 30,
              top: 60,
              child: Text(
                '${credintial!.uid}',
                textAlign: TextAlign.center,
                style: TextStyle(
                   color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.88,
                ),
              ),
            ),
          ],
        ),
      ),*/
                Container(
                  width: 320,
                  height: 105,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 0,
                        child: Text(
                          'Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                            fontFamily: 'Playfair Displa',
                            fontWeight: FontWeight.w700,
                            height: 1.88,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 45,
                        child: Container(
                          width: 320,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        top: 35,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(
                              
                              onPressed: (){

                              myDialog('Email');


                              },
                              
                              
                              icon: Icon(Icons.edit)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 60,
                        child: Text(
                          '${credintial!.email}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.88,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320,
                  height: 105,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 45,
                        child: Container(
                          width: 320,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        top: 35,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(
                              
                              onPressed: (){




                              },
                              
                              
                              icon: Icon(Icons.edit)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 60,
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.88,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 0,
                        child: Text(
                          'Field',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                            fontFamily: 'Playfair Displa',
                            fontWeight: FontWeight.w700,
                            height: 1.88,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320,
                  height: 105,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 45,
                        child: Container(
                          width: 320,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        top: 35,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(Icons.edit, color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21,
                        top: 0,
                        child: Text(
                          'Year of Establishment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                            fontFamily: 'Playfair Displa',
                            fontWeight: FontWeight.w700,
                            height: 1.88,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 60,
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.88,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320,
                  height: 105,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 45,
                        child: Container(
                          width: 320,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        top: 35,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(Icons.edit, color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21,
                        top: 0,
                        child: Text(
                          'Phone Number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                            fontFamily: 'Playfair Displa',
                            fontWeight: FontWeight.w700,
                            height: 1.88,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 60,
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.88,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320,
                  height: 105,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 45,
                        child: Container(
                          width: 320,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        top: 35,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(Icons.edit, color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21,
                        top: 0,
                        child: Text(
                          'Headquarters',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                            fontFamily: 'Playfair Displa',
                            fontWeight: FontWeight.w700,
                            height: 1.88,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 60,
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.88,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320,
                  height: 105,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 45,
                        child: Container(
                          width: 320,
                          height: 400,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF4F4F4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        top: 35,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(Icons.edit, color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 0,
                        child: Text(
                          'Description',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF616161),
                            fontFamily: 'Playfair Displa',
                            fontWeight: FontWeight.w700,
                            height: 1.88,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        top: 55,
                        child: Text(
                          ' ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.88,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }
}

