import 'dart:io';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/entity/user_entity.dart';
import 'package:friendlychat/repository/user_repository.dart';
import 'package:friendlychat/repository/messages_repository.dart';



class AppState {

  UserEntity loggedUser;
  bool isLoading;
  int currentCounter;
  DatabaseReference databaseReference;

  AppState({
    this.loggedUser,
    this.databaseReference,

    this.currentCounter: 0,
    this.isLoading: false,
  });

//  @override
//  int get hashCode => loggedUser.hashCode ^ currentCounter.hashCode ^ isLoading.hashCode ^ databaseReference.hashCode;
//
//  @override
//  bool operator ==(Object other) =>
//      identical(this, other)
//          || other is AppState
//          && runtimeType == other.runtimeType
//          && loggedUser == other.loggedUser
//          && currentCounter == other.currentCounter
//          && isLoading == other.isLoading
//          && databaseReference == other.databaseReference;

}


class FriendlychatAppContainer extends StatefulWidget {

  final AppState appState;
  final UserRespository userRespository;
  final MessageRespository messageRespository;
  final Widget child;

  FriendlychatAppContainer({
    this.appState,

    this.userRespository = const UserRespository(),
    this.messageRespository = const MessageRespository(),

    @required this.child,
  });

  static FriendlychatAppContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer)
        .data;
  }

  @override
  State<StatefulWidget> createState() {
    return new FriendlychatAppContainerState();
  }
}

class FriendlychatAppContainerState extends State<FriendlychatAppContainer> {

  AppState appState;


  @override
  void initState() {
    if (widget.appState != null) {
      appState = widget.appState;
    } else {
      appState = new AppState(
        loggedUser: UserEntity.guest,
      );

      _login();
    }

//    widget.repository.loadTodos().then((loadedTodos) {
//      setState(() {
//        state = new AppState(
//          todos: loadedTodos.map(Todo.fromEntity).toList(),
//        );
//      });
//    }).catchError((err) {
//      setState(() {
//        state.isLoading = false;
//      });
//    });

    super.initState();
  }

  void login() {
    _login();
  }


  void _login() {
    setState(() {
      appState.isLoading = true;
    });

    widget.userRespository.login().then((loggedUser) {
      setState(() {
        appState.isLoading = false;
        appState.loggedUser = loggedUser;
        appState.databaseReference = widget.messageRespository.databaseReference();
      });
    });
  }

  void raiseCounter() {
    setState(() {
      appState.currentCounter += 1;
    });
  }

  void logout() {
    setState(() {
      appState.isLoading = true;
    });

    widget.userRespository.logout().then((loggedUser) {
      setState(() {
        appState.isLoading = false;
        appState.loggedUser = UserEntity.guest;
        appState.databaseReference = null;
        appState.currentCounter = 0;
      });
    });
  }

  void sendMessage(String text, File imageFile) {
    widget.messageRespository.sendMessage(appState.loggedUser, text, imageFile);
  }



  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }

}


class _InheritedStateContainer extends InheritedWidget {
  final FriendlychatAppContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  })
      : super(key: key, child: child);

  // Note: we could get fancy here and compare whether the old AppState is
  // different than the current AppState. However, since we know this is the
  // root Widget, when we make changes we also know we want to rebuild Widgets
  // that depend on the StateContainer.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
