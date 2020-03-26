import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_google_sign_in/utils/Var/Colors.dart';
import 'package:firebase_google_sign_in/utils/PageRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> test = ['Vorname Nachname', 'Vorname Nachname', 'Vorname Nachname' ];

class ShowChats extends StatefulWidget{
  final String currentUserId;

  ShowChats({Key key, @required this.currentUserId}) : super(key: key);
  _ListChats createState() => _ListChats(currentUserId: currentUserId);
}

class _ListChats extends State<ShowChats> with SingleTickerProviderStateMixin {
  _ListChats({Key key, @required this.currentUserId});
  final String currentUserId;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                    ),
                  );
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
                    itemCount: snapshot.data.documents.length,
                  );
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: (
                Container(
                  margin: EdgeInsets.all(8),
                  child: FloatingActionButton(
                    heroTag: 'fabChatCam',
                    onPressed: (){
                      Navigator.of(context).push(contactsRoute());
                    },
                    child: Icon(
                        Icons.add
                    ),
                  ),
                )
            ),
          )
        ],
      )
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['id'] == currentUserId) {
      return Container();
    } else {
      return Container(
        child: InkWell(
          onTap: () => NavigateToChat(context, document, currentUserId),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Material(
                    child: document['photoUrl'] != null
                        ? CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        child: CircularProgressIndicator(
                          strokeWidth: 1.0,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                        width: 50.0,
                        height: 50.0,
                        padding: EdgeInsets.all(15.0),
                      ),
                      imageUrl: document['photoUrl'],
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    )
                        : Icon(
                      Icons.account_circle,
                      size: 50.0,
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    clipBehavior: Clip.hardEdge,
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Text(
                                  '${document['nickname']}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight
                                          .bold,
                                      color: Colors.black87
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0, 0, 8, 0),
                                  child: Text(
                                    '11:13',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 6),
                            child: Text(
                              '${document['aboutMe'] ?? 'Not available'}',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Divider(
                  color: Colors.black38,
                  endIndent: 10,
                  indent: 59,
                  height: 1,
                ),
              )
            ],
          )
        ),
      );
    }
  }
}