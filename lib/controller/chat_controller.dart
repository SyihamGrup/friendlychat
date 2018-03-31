import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter/cupertino.dart';

import 'package:friendlychat/redux/app_state.dart';





class ChatController extends StatefulWidget {


  @override
  State createState() => new _ChatControllerState();

}

class _ChatControllerState extends State<ChatController> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          //appBar: new AppBar(
          //  title: new Text('Counter')
          //),
          body: _buildBody(context),
        );

  }


  Widget _buildBody(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              //backgroundImage: new NetworkImage(store.state.googleSignIn.currentUser.photoUrl),
            ),
          ),
          //new Text(store.state.googleSignIn.currentUser.displayName),
          new FlatButton(
            onPressed: () async {
              //await store.state.auth.signOut();
            },
            child: new Text('SIGN OUT'),
          ),
        ],
      ),
    );
  }

}