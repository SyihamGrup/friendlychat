import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/entity/user_entity.dart';
import 'package:friendlychat/repository/messages_repository.dart';
import 'package:friendlychat/repository/user_repository.dart';
import 'package:meta/meta.dart';

import '../screen/firebase_chat_screen.dart';
import '../screen/counter_screen.dart';
import '../screen/user_screen.dart';

import '../friendlychat_app.dart';




class _FlowState {

  UserEntity loggedUser;
  bool isLoading;
  int currentCounter;
  DatabaseReference databaseReference;
  AppRouteDetails selectedTabRoute;

  _FlowState({
    this.loggedUser,
    this.databaseReference,
    this.selectedTabRoute,

    this.currentCounter: 0,
    this.isLoading: false,
  });

}


class MainFlow extends StatefulWidget {

  _FlowState flowState;

  final UserRespository userRespository;
  final MessageRespository messageRespository;


  MainFlow({
    Key key,
    this.flowState,

    @required this.userRespository,
    @required this.messageRespository,
  }) :
        super(key: key);


  @override
  State createState() => new _MainFlowState();

}

class _MainFlowState extends State<MainFlow> {

  _FlowState flowState;

  @override
  void initState() {
    if (widget.flowState != null) {
      flowState = widget.flowState;
    } else {
      flowState = new _FlowState(
        loggedUser: UserEntity.guest,
        selectedTabRoute: AppRoute.counterMainTab,
      );

      _login();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      return new Scaffold(
        body: new Stack(
        children: <Widget>[

          new Offstage(
            offstage: flowState.selectedTabRoute != AppRoute.counterMainTab,
            child: new CounterPage(
              currentCounter: flowState.currentCounter,
              counterAction: () => raiseCounter(),
            ),
          ),

          new Offstage(
            offstage: flowState.selectedTabRoute != AppRoute.userMainTab,
            child: new UserPage(
              loginAction: () => login(),
              signoutAction: () => logout(),
              user: flowState.loggedUser,
              currentCounter: flowState.currentCounter,
            ),
          ),

        ],
      ),

      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: flowState.selectedTabRoute.index,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).accentColor,
        onTap: (int index) {
          setState(() {
            flowState.selectedTabRoute = AppRoute.fromMainTabIndex(index).details;
          });
        },
        items: <BottomNavigationBarItem>[
          CounterPage.bottomNavigationBarItem,
          UserPage.userPageBottomNavigationBarItem,
        ],
      ),
    );

  }



  void login() {
    _login();
  }


  void _login() {
    setState(() {
      flowState.isLoading = true;
    });

    widget.userRespository.login().then((loggedUser) {
      setState(() {
        flowState.isLoading = false;
        flowState.loggedUser = loggedUser;
        flowState.databaseReference = widget.messageRespository.databaseReference();
      });
    });
  }

  void raiseCounter() {
    setState(() {
      flowState.currentCounter += 1;
    });
  }

  void logout() {
    setState(() {
      flowState.isLoading = true;
    });

    widget.userRespository.logout().then((loggedUser) {
      setState(() {
        flowState.isLoading = false;
        flowState.loggedUser = UserEntity.guest;
        flowState.databaseReference = null;
        flowState.currentCounter = 0;
      });
    });
  }

  void sendMessage(String text, File imageFile) {
    widget.messageRespository.sendMessage(flowState.loggedUser, text, imageFile);
  }


}

