
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/entity/user_entity.dart';
import 'package:friendlychat/repository/user_repository.dart';



class AppState {

  UserEntity loggedUser;
  bool isLoading;
  int currentCounter;

  AppState({
    this.loggedUser,

    this.currentCounter: 0,
    this.isLoading: false,
  });

}


class FriendlychatAppContainer extends StatefulWidget {

  final AppState appState;
  final UserRespository userRespository;
  final Widget child;

  FriendlychatAppContainer({
    this.appState,

    this.userRespository = const UserRespository(),

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
    }

//    if (appState.loggedUser.id == null) {
//      _login();
//    }


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
      });
    });
  }

//  void toggleAll() {
//    setState(() {
//      state.toggleAll();
//    });
//  }
//
//  void updateFilter(VisibilityFilter filter) {
//    setState(() {
//      state.activeFilter = filter;
//    });
//  }
//
//  void updateTodo(
//      Todo todo, {
//        bool complete,
//        String id,
//        String note,
//        String task,
//      }) {
//    setState(() {
//      todo.complete = complete ?? todo.complete;
//      todo.id = id ?? todo.id;
//      todo.note = note ?? todo.note;
//      todo.task = task ?? todo.task;
//    });
//  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

//    widget.repository
//        .saveTodos(state.todos.map((todo) => todo.toEntity()).toList());
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

//typedef TodoUpdater(
//    Todo todo, {
//      bool complete,
//      String id,
//      String note,
//      String task,
//    });
