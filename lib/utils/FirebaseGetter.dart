import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// Do not change
getCurrentUserInfo()async{
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  if (firebaseUser != null) {
    // Already signed up?
    final QuerySnapshot result = await Firestore.instance.collection('users').where('id', isEqualTo: firebaseUser.uid).getDocuments();
    final List < DocumentSnapshot > documents = result.documents;
    if (documents.length == 0) {
      // Insert into Firebase if user does not exist
      Firestore.instance.collection('users').document(firebaseUser.uid).setData(
          { 'nickname': firebaseUser.displayName, 'photoUrl': firebaseUser.photoUrl, 'id': firebaseUser.uid });
      }
  }
  else{
    return null;
  }
}

isUserSignedIn(){
  if (FirebaseAuth.instance.currentUser() == null){
    // not logged in
    return false;
  }
  else{
    // logged in
    return true;
  }
}

