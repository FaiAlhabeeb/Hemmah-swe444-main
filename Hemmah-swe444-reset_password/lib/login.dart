import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:hemmah/job_list.dart';
import 'homepageapplicant.dart';
import 'reset_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hemmah/homepage.dart';

final credintial = FirebaseAuth.instance.currentUser;

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailp = TextEditingController();
  bool isLoading = false;
  var state;
  String u = "";
  final passp = TextEditingController();
  @override
  void dispose() {
    emailp.dispose();
    passp.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  String validate(){
      
      if (emailp.text == "") {
        return "empty";
      } else if (passp.text == "") {
        return "empty";
      } 
      
       
       else {
        return "done";
      }
      
    }
  
  @override
  Widget build(BuildContext context) {
    
    String vv ="";
    Future<bool> login() async {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailp.text,
          password: passp.text,
        );
        var collection = FirebaseFirestore.instance.collection('Applicants');
        var collection1 = FirebaseFirestore.instance.collection('Compony');
         final FirebaseAuth auth = FirebaseAuth.instance;
                      final User? user = auth.currentUser;
                      u = user!.uid;
        
        
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          if (doc.id == u){  state="A"; }

          // <-- Retrieving the value.
        }
      });
      collection1.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          if (doc.id == u){  state="C"; }

          // <-- Retrieving the value.
        }
      });

         vv="D";
        return true; 
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          final snackBar = SnackBar(
            content: const Text('No user found for that email.'),
            action: SnackBarAction(
              label: 'close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar); vv = "notfound";
          return false;
        } else if (e.code == 'wrong-password') {
          final snackBar = SnackBar(
            content: const Text('Wrong password provided for that user.'),
            action: SnackBarAction(
              label: 'close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar); vv="wrong";
          return false;
        } else {
          return false;
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: SizedBox(
                    width: 349,
                    child: Text(
                      'Welcome Back!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                       
                        fontSize: 32,
                        color: Color(0xFF616161),

fontFamily: 'Playfair Displa',
fontWeight: FontWeight.w700,
                        height: 1.44,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    // we return "null" when something is valid
                    validator: (value) {
                      return !value.toString().isEmpty ? null : "Empty";
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailp,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: const InputDecoration(
                        hintText: "Enter Your Email : ",
                        suffixIcon: Icon(Icons.email_outlined))),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    // we return "null" when something is valid
                    validator: (value) {
                      return !value.toString().isEmpty ? null : "Empty";
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passp,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Your password : ",
                        suffixIcon: Icon(Icons.visibility))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if(validate() == "done"){
                      bool x;
                    x = await login();
                    
                    if (!mounted) return;
                    if (x) {
                     
                      if(state=="C"){Navigator.pushNamed(context, '/homepage');}
                      if(state =="A") {Navigator.pushNamed(context, '/homepageapplicant');}
                    } }
                    else if (validate() == "empty"){
                      
                      final snackBar = SnackBar(
                        content: const Text(
                            'Some of the field is empty'),
                        action: SnackBarAction(
                          label: 'close',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    
                    }
                    else if (vv == "wrong"){
                      
                      final snackBar = SnackBar(
                        content: const Text(
                            'Wrong password provided for that user.'),
                        action: SnackBarAction(
                          label: 'close',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    
                    }
                    else if (vv == "notfound"){
                      
                      final snackBar = SnackBar(
                        content: const Text(
                            'No user found for that email.'),
                        action: SnackBarAction(
                          label: 'close',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    
                    }
                    
                    
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                         color: Colors.white,
                        )
                      : Text(
                          "Login",
                          style: TextStyle(fontSize: 19,
                          color:Color(0xFFF5F5F5),
                          
                          ),
                          
                        ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFD1C4E9)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(left:23,right: 23)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 350,
                    height: 30,
                    margin: EdgeInsets.fromLTRB(50, 20, 0, 0),
                    child: Row(children: [
                      Text(
                        'you dont have an account ? ',
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 18,
                          fontFamily: 'Playfair Displa',
fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            
                            fontSize: 15,
                            color: Color.fromARGB(151, 97, 97, 97),
                        
                          fontFamily: 'Playfair Displa',
fontWeight: FontWeight.w700,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/userchoice');
                        },
                      )
                    ])),
                Container(
                    child: TextButton(
                  child: Text("Forget Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Color.fromARGB(151, 97, 97, 97),
                          
                          fontFamily: 'Playfair Displa',
fontWeight: FontWeight.w700,
                        fontSize: 18,
                        
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen()),
                    );
                  },
                )),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
