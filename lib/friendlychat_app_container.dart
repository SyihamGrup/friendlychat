
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class FriendlychatAppContainer extends StatefulWidget {
//  final AppState state;
//  final TodosRepository repository;
  final Widget child;

  FriendlychatAppContainer({
    @required this.child,
//    this.repository = const TodosRepositoryFlutter(
//      fileStorage: const FileStorage(
//        'inherited_widget_sample',
//        getApplicationDocumentsDirectory,
//      ),
//    ),
//    this.state,
  });

  static _FriendlychatAppContainerState of(BuildContext context) {
    _FriendlychatAppContainer container = (context.inheritFromWidgetOfExactType(_FriendlychatAppContainer) as _FriendlychatAppContainer);
    return container.data;
  }

  @override
  State<StatefulWidget> createState() {
    return new _FriendlychatAppContainerState();
  }
}

class _FriendlychatAppContainerState extends State<FriendlychatAppContainer> {

//  AppState state;

  @override
  void initState() {
//    if (widget.state != null) {
//      state = widget.state;
//    } else {
//      state = new AppState.loading();
//    }
//
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

//  void toggleAll() {
//    setState(() {
//      state.toggleAll();
//    });
//  }
//
//  void clearCompleted() {
//    setState(() {
//      state.clearCompleted();
//    });
//  }
//
//  void addTodo(Todo todo) {
//    setState(() {
//      state.todos.add(todo);
//    });
//  }
//
//  void removeTodo(Todo todo) {
//    setState(() {
//      state.todos.remove(todo);
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
    return new _FriendlychatAppContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _FriendlychatAppContainer extends InheritedWidget {
  final _FriendlychatAppContainerState data;

  _FriendlychatAppContainer({
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
  bool updateShouldNotify(_FriendlychatAppContainer old) => true;
}

//typedef TodoUpdater(
//    Todo todo, {
//      bool complete,
//      String id,
//      String note,
//      String task,
//    });
