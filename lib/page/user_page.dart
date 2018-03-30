import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:friendlychat/redux/app_state.dart';
import 'package:friendlychat/redux/actions.dart';


final userPageBottomNavigationBarItem = new BottomNavigationBarItem(
  icon: new Icon(Icons.person),
  title: new Text('User'),
);

class UserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder(
      onInit: ((store) {

      }),
      onDispose: ((store) {

      }),
      builder: (context, Store<AppState> store) {
        return new Scaffold(
          //appBar: new AppBar(
          //  title: new Text('Counter')
          //),
          body: _buildBody(context, store),
        );
      },
    );

  }


  Widget _buildBody(BuildContext context, Store<AppState> store) {
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