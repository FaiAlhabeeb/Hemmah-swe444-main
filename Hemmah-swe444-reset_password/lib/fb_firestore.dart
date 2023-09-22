import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hemmah/contex_extenssion.dart';

import 'fb_respone.dart';
import 'firebase_helper.dart';
import 'job.dart';


class FbFirestoreController with FirebaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> create(Job job, BuildContext context) async {
    _firestore
        .collection('Posts')
        .add(job.toMap())
        .then((value) => context.showSnackBar(
            message: successResponse.message, error: false))
        .catchError((error) =>
            context.showSnackBar(message: errorResponse.message, error: true));
  }

  Stream<QuerySnapshot<Job>> read(String companyEmail) async* {
    yield* _firestore
        .collection('Posts')
        .where('companyEmail', isEqualTo: companyEmail)
        .withConverter<Job>(
          fromFirestore: (snapshot, options) => Job.fromMap(snapshot.data()!),
          toFirestore: (value, options) => value.toMap(),
        )
        .snapshots();
  }

  Future<FbResponse> delete(String id) async {
    return _firestore
        .collection('Posts')
        .doc(id)
        .delete()
        .then((value) => successResponse)
        .catchError((error) => errorResponse);
  }
}
