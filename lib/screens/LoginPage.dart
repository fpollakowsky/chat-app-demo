import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_google_sign_in/utils/PageRoutes.dart';
import 'package:firebase_google_sign_in/utils/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> with SingleTickerProviderStateMixin{
  double _heightTopBar = 0;
  int _durationUpper = 2;
  int _durationLower = 2;
  Color _colorOrange600 = Colors.deepOrange[600];
  Color _colorOrange800 = Colors.deepOrange[800];
  double _opacityText = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  String _userID;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Messaging',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.ease,
                  height: _heightTopBar,
                  decoration: (BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.25, 0.5, 0.75, 1],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.deepOrange[500],
                          Colors.deepOrange[600],
                          Colors.deepOrange[800],
                          Colors.deepOrange[900],
                        ],
                      )
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: 42,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                          )
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 16,right: 16),
                            child: Material(
                                color: Colors.transparent,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(bottom: 32),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            labelText: 'E-Mail',
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 0.5),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 1)
                                            )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 16),
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 0.5),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 1)
                                            )
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 32),
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            labelText: 'Repeat Password',
                                            labelStyle: TextStyle(
                                                color: Colors.white
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 0.5),
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 1)
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          )
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.all(16),
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    height: 42,
                                    width: MediaQuery.of(context).size.width,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Text("Login"),
                                      color: Colors.white,
                                      textColor: Colors.black, onPressed: () {},
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 8),
                                            child: OutlineButton(
                                              borderSide: BorderSide(color: Colors.white, width: 2),
                                              splashColor: Colors.white,
                                              onPressed: (){},
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(flex:1, child: Icon(Icons.nature_people, color: Colors.white,),),
                                                  Expanded(flex:5, child: Text('Facebook', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),)
                                                ],
                                              ),
                                            ),
                                          )
                                      ),
                                      Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: OutlineButton(
                                              borderSide: BorderSide(color: Colors.white, width: 2),
                                              splashColor: Colors.white,
                                              onPressed: (){},
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(flex:1, child: Icon(Icons.person, color: Colors.white,),),
                                                  Expanded(flex:5, child: Text('Google',textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),)
                                                ],
                                              ),
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ],
                              )
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.25, 0.5, 0.75],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.deepOrange[500],
                          Colors.deepOrange[600],
                          Colors.deepOrange[800],
                        ],
                      )
                  ),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                        ),
                      ),
                      Expanded(
                        child: Container(
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                            ),
                            child: AnimatedContainer(
                              duration: Duration(seconds: _durationUpper),
                              curve: Curves.linear,
                              height: 100,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    stops: [0,1],
                                    colors: [
                                      _colorOrange600,
                                      _colorOrange800,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(100))
                              ),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: OutlineButton(
                                    borderSide: BorderSide.none,
                                    onPressed: (){
                                      setState(() {
                                        _heightTopBar = 0;
                                        _colorOrange600 = Colors.deepOrange[600];
                                        _colorOrange800 = Colors.deepOrange[800];
                                        _durationLower = 4;
                                        _durationUpper = 1;
                                        _opacityText = 0;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(100),topLeft: Radius.circular(100),bottomRight: Radius.circular(16))),
                                    child: AnimatedOpacity(
                                      opacity: _opacityText,
                                      duration: Duration(seconds: 1),
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.deepOrange
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0, 1],
                                colors: [
                                  Colors.deepOrange[800],
                                  Colors.deepOrange[900],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.deepOrange,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(30))
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0, 1],
                                  colors: [
                                    Colors.deepOrange[500],
                                    Colors.deepOrange[600],
                                  ],
                                ),
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(48))
                            ),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: OutlineButton(
                                borderSide: BorderSide.none,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(100), top: Radius.circular(16))),
                                disabledBorderColor: Colors.transparent,
                                onPressed: (){
                                  setState(() {
                                    _heightTopBar = MediaQuery.of(context).size.height - 60;
                                    _colorOrange600 = Colors.white;
                                    _colorOrange800 = Colors.white;
                                    _durationLower = 2;
                                    _durationUpper = 1;
                                    _opacityText = 1;
                                  });
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          )
                      ),
                      Expanded(
                        child: AnimatedContainer(
                          duration: Duration(seconds: _durationLower),
                          curve: Curves.fastLinearToSlowEaseIn,
                          color: _colorOrange600,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(32))
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(16),
                        child: Form(
                          key: _formKey,
                          child: Material(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: TextFormField(
                                    controller: _emailController,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'E-Mail',
                                        labelStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.deepOrange, width: 1)
                                        )
                                    ),
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: _passwordController,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.deepOrange, width: 1)
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(16),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 16),
                              height: 42,
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      side: BorderSide(color: Colors.deepOrange)
                                  ) ,
                                  child: Text("Login"),
                                  color: Colors.deepOrange,
                                  textColor: Colors.white,
                                  onPressed: () async {
                                    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ))
                                        .user;
                                    if (user != null) {
                                      setState(() {
                                        _userEmail = user.email;
                                        _userID = user.uid;
                                        _success = true;
                                        NavigateTabBarMain(context, _userID);
                                      });
                                    } else {
                                      _success = false;
                                    }
                                  }
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: OutlineButton(
                                        borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                                        splashColor: Colors.deepOrange,
                                        onPressed: (){},
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(flex:1, child: Icon(Icons.nature_people),),
                                            Expanded(flex:5, child: Text('Facebook',textAlign: TextAlign.center),)
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: OutlineButton(
                                        borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                                        splashColor: Colors.deepOrange,
                                        onPressed: () {
                                          signInWithGoogle(context);
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(flex:1, child: Icon(Icons.person),),
                                            Expanded(flex:5, child: Text('Google',textAlign: TextAlign.center),)
                                          ],
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ],
                        )
                    )
                )
              ],
            );
          }),
    );
  }
}