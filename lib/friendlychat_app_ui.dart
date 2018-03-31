
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class FriendlychatAppUI extends StatefulWidget {
  final Widget child;

  FriendlychatAppUI({
    @required this.child,
  });

  static _FriendlychatAppUIState of(BuildContext context) {
    _FriendlychatAppTheme container = (context.inheritFromWidgetOfExactType(_FriendlychatAppTheme) as _FriendlychatAppTheme);
    return container.data;
  }

  @override
  State<StatefulWidget> createState() {
    return new _FriendlychatAppUIState();
  }
}

class _FriendlychatAppUIState extends State<FriendlychatAppUI> {

  // if defaultTargetPlatform == TargetPlatform.iOS

  ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
    accentColor: Colors.blueAccent,
  );

  @override
  void initState() {
    // ....

    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

    // ....
  }

  @override
  Widget build(BuildContext context) {
    return new _FriendlychatAppTheme(
      data: this,
      child: widget.child,
    );
  }
}

class _FriendlychatAppTheme extends InheritedWidget {
  final _FriendlychatAppUIState data;

  _FriendlychatAppTheme({
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
  bool updateShouldNotify(_FriendlychatAppTheme old) => true;
}
