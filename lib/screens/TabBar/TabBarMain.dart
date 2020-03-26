import 'package:firebase_google_sign_in/screens/TabBar/OpenCamera.dart';
import 'package:firebase_google_sign_in/screens/TabBar/ShowAllChats.dart';
import 'package:firebase_google_sign_in/utils/Var/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarMain extends StatefulWidget{
  final String currentUserId;

  TabBarMain({Key key, @required this.currentUserId}) : super(key: key);
  _TabBar createState() => _TabBar(usrID: currentUserId);
}

class _TabBar extends State<TabBarMain> with SingleTickerProviderStateMixin {
  _TabBar({Key key, @required this.usrID});
  String usrID;
  final List<Tab> myTabs = <Tab>[
    Tab(child: Padding(padding: EdgeInsets.all(8),child: Icon(Icons.camera_alt),),),
    Tab(text: 'Chats'),
    Tab(text: 'Status'),
    Tab(text: 'Anrufe')
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length, initialIndex: 1);
    _tabController.addListener(() {
      setState(() {});
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(child: Padding(padding: EdgeInsets.all(8),child: Icon(Icons.camera_alt),),),
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Anrufe')
          ],
          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: 4.0)
          ),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children:
          [
            OpenCamera(camera: null,),
            ShowChats(currentUserId: usrID,),
            Icon(Icons.add),
            Icon(Icons.share),
          ]
      ),
    );
  }
}
