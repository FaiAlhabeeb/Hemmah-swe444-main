import 'package:flutter/material.dart';
import 'package:hemmah/settingsApplicant.dart';

import 'SettingsC.dart';





class aboutusApplicant extends StatefulWidget {

  const aboutusApplicant ({super.key});


  @override
  State<aboutusApplicant> createState() => _aboutusApplicant();
}


class _aboutusApplicant extends State<aboutusApplicant> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar:AppBar(
backgroundColor: Color(0xFFF3E5F5),
        leading:IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFF616161),
            ),
            onPressed:() {
              Navigator.push(context,MaterialPageRoute(builder: (context) => SettingsApplicant()));

            }
        ),
        title:
        Text('About Us',
          style: TextStyle(
           
fontFamily:' Playfair Displa',
  color: Color(0xFF616161),
    
    fontWeight: FontWeight.w700,
          fontSize: 25,
          ),


        ),

      ),
      body:
      SingleChildScrollView(child:
      Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          SizedBox(width:400),
          SizedBox(height:60),

          Stack(
            children: [
              CircleAvatar(
                radius: 75,
                backgroundColor: Colors.grey.shade200,
                child: CircleAvatar(
                  radius: 70,

                 backgroundImage: AssetImage("img/HEEMMA.png"),
       

                ),
              ),
            ],
          ),


          SizedBox(height: 40,),
          Container(
            height: 300,
            width: 350,
            decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(60),
            ),
            alignment: Alignment.bottomLeft,

            child: Align(
              alignment: Alignment.center,

              child: Text(
                "Hemmah is an application that connects employee in the public and private sectors and people with special needs, In order to contribute to their empowerment by participating in the development of the homelands, so that people with special needs can be empowered by developing their abilities and skills  , It is an application that helps people with special needs to find jobs that suit them.   As mentioned above, Hemma's goal is to save time and effort for job seekers with special needs and companies that wish to hire this category."
                ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
color: Color(0xFF616161),

fontFamily: 'Playfair Displa',
fontWeight: FontWeight.w700,

                ),
              ),
            ),
          ),





        ],
      ),


      ),

    );
  }
}