import 'package:flutter/material.dart';

import 'package:friendlychat/page/chat_page.dart';
import 'package:friendlychat/page/counter_page.dart';
import 'package:friendlychat/page/user_page.dart';
import 'package:friendlychat/friendlychat_app.dart';
import 'package:friendlychat/friendlychat_app_container.dart';

class MainTabController extends StatefulWidget {

  AppRouteDetails selectedTabRoute;

  MainTabController({
    Key key,
    this.selectedTabRoute,
  }) :
        super(key: key);


  @override
  State createState() => new _MainTabControllerState();

}

class _MainTabControllerState extends State<MainTabController> {

  FriendlychatAppContainerState _container;

  @override
  Widget build(BuildContext context) {
    _container = FriendlychatAppContainer.of(context);

    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: widget.selectedTabRoute != AppRoute.counterMainTab,
            child: new CounterPage(
              currentCounter: _container.appState.currentCounter,
              counterAction: () => _container.raiseCounter(),
            ),
          ),
          new Offstage(
            offstage: widget.selectedTabRoute != AppRoute.chatMainTab,
            child: new ChatPage(
              user: _container.appState.loggedUser,
              loginAction: () => _container.login(),
            ),
          ),
          new Offstage(
            offstage: widget.selectedTabRoute != AppRoute.userMainTab,
            child: new UserPage(
              loginAction: () => _container.login(),
              signoutAction: () => _container.logout(),
              user: _container.appState.loggedUser,
            ),
          ),
        ],
      ),

      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: widget.selectedTabRoute.index,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).accentColor,
        onTap: (int index) {
          setState(() {
            widget.selectedTabRoute = AppRoute.fromMainTabIndex(index).details;
          });
        },
        items: <BottomNavigationBarItem>[
          CounterPage.bottomNavigationBarItem,
          ChatPage.bottomNavigationBarItem,
          UserPage.userPageBottomNavigationBarItem,
        ],
      ),
    );

  }


}
