import 'dart:async';

import 'package:firebase_google_sign_in/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash_Screen extends StatefulWidget {
  final String sc_text;

  Splash_Screen({Key key, this.sc_text}) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  bool _visible = false;
  @override
  void initState(){
    Timer(const Duration(milliseconds: 500), (){
      setState(() {
        _visible = !_visible;
      });
    });
    Timer(const Duration(milliseconds: 2500), (){
      setState(() {
        _visible = !_visible;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 1000),
            child: SplashScreen(
              seconds: 4,
              navigateAfterSeconds: LoginPage(),
              backgroundColor: Colors.white,
              loaderColor: Colors.transparent,
              title: Text(
                widget.sc_text,
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange
                ),
              ),
            ),
          ),
        )
    );
  }
}