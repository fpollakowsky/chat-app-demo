import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Column(
                  children: <Widget>[
                    Align(alignment: Alignment.topLeft, child: Text('Kontakt wählen')),
                    Align(alignment: Alignment.topLeft, child: Text('91 Kontakte', style: TextStyle(fontSize: 12),textAlign: TextAlign.left,)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Icon(Icons.search),
              ),
              Expanded(
                flex: 2,
                child: Icon(Icons.more_vert),
              )
            ],
          )
        ),
      ) ;
  }
}