import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

class userchoice extends StatelessWidget {
  const userchoice({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:Container(
  width: double.infinity,
  height: double.infinity,
  clipBehavior: Clip.antiAlias,
  decoration: ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  child: Column(
    children: [
         Container(
          width: 300,
          height: 400,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Container(
                margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                width: 250,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/choice.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      
      Center(
        child: Container(
         margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: SizedBox(
            width: 200,
            child: Text(
              'You want sign up as?',
              textAlign: TextAlign.center,
              style: TextStyle(
                
                fontSize: 20,
                color: Color(0xFF616161),

fontFamily: 'Playfair Displa',
fontWeight: FontWeight.w700,
                height: 1.44,
              ),
            ),
          ),
        ),
      ),
      
      
      
      InkWell(
        
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
         decoration: ShapeDecoration(
            color: Color(0xFFD1C4E9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: 
              Text(
                'As applicant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'El Messiri',
                  fontWeight: FontWeight.w600,
                ),
              
          ),
        ),
      onTap: () {
         Navigator.pushNamed(context, '/SignupAsApplicants');
      },),
       InkWell(
        
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
         decoration: ShapeDecoration(
            color: Color(0xFFD1C4E9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
                   
            ),
          ),
          child: 
              Text(
                'As compony',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'El Messiri',
                  fontWeight: FontWeight.w600,
                ),
              ),
           
         
        ),
      onTap: () {
         Navigator.pushNamed(context, '/signup');
      },),
      
    
    ],
  ),
)

             
      );
  }
}