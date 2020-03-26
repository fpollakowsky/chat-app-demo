import 'package:firebase_google_sign_in/screens/TabBar/ShowContacts.dart';
import 'package:firebase_google_sign_in/screens/TabBar/ShowOneChat.dart';
import 'package:firebase_google_sign_in/screens/TabBar/TabBarMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

NavigateTabBarMain(context, usrID){
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return TabBarMain(currentUserId: usrID,);
      },
    ),
  );
}

NavigateToChat(context, document, currentUserID){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Chat(
            currentUserID: currentUserID,
            peerId: document.documentID,
            peerAvatar: document['photoUrl'],
          )
      )
  );
}

//Animations
contactsRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Contacts(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}