import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hemmah/contex_extenssion.dart';
import 'package:hemmah/post_job_screen.dart';

import 'custom_job_card.dart';
import 'fb_firestore.dart';
import 'fb_respone.dart';
import 'job.dart';

class JobList extends StatelessWidget {
  void deleteJob(BuildContext context, String id) async {
    FbResponse fbResponse = await FbFirestoreController().delete(id);
    // ignore: use_build_context_synchronously
    context.showSnackBar(
        message: fbResponse.message, error: !fbResponse.success);
  }

  final credintial = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: Scaffold(
       appBar: AppBar(
        
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF3E5F5),
        actions: [
          IconButton(onPressed:() {
            
          }, icon: Icon(Icons.search
          ,color: Color(0xFF616161),
          )),
        ],

        title: Text(
              "Home",
              style: TextStyle(
                fontFamily: ' Playfair Displa',
                color: Color(0xFF616161),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
      ),
        body: StreamBuilder<QuerySnapshot<Job>>(
          stream: FbFirestoreController().read(credintial!.email.toString()),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                itemBuilder: (context, index) {
                  var jobData = snapshot.data!.docs[index].data();
                  return CustomJobCard(
                      position: jobData.position,
                      workplaceType: jobData.workplaceType,
                      jobType: jobData.jobType,
                      location: jobData.location,
                      description: jobData.description ?? "",
                      onDelete: () {
                        // Delete the job from Firestore when onDelete is called
                        deleteJob(
                          context,
                          snapshot.data!.docs[index].id,
                        );
                        Navigator.of(context).pop();
                      });
                },
              );
            } else {
              return const Padding(
                padding: EdgeInsets.only(top: 271.0, left: 70.0),
                child: Text(
                  'Sorry, No Posted Jobs Yet',
                  style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 20,
                    fontFamily: 'Playfair Displa',
                    fontWeight: FontWeight.w700,
                    height: 1.88,
                  ),
                ),
              );
            }
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Job getPost(QueryDocumentSnapshot<Job> queryDocumentSnapshot) {
    Job job = Job();
    job.id = queryDocumentSnapshot.id;
    job.position = queryDocumentSnapshot.data().position;
    job.workplaceType = queryDocumentSnapshot.data().workplaceType;
    job.jobType = queryDocumentSnapshot.data().jobType;
    job.location = queryDocumentSnapshot.data().location;
    job.description = queryDocumentSnapshot.data().description;
    job.companyEmail = queryDocumentSnapshot.data().companyEmail;
    return job;
  }
}
