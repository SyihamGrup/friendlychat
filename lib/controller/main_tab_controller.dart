import 'package:flutter/material.dart';

import 'package:friendlychat/page/chat_page.dart';
import 'package:friendlychat/page/counter_page.dart';
import 'package:friendlychat/page/user_page.dart';
import 'package:friendlychat/friendlychat_app.dart';


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


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: widget.selectedTabRoute != AppRoute.counterMainTab,
            child: new CounterPage(),
          ),
          new Offstage(
            offstage: widget.selectedTabRoute != AppRoute.chatMainTab,
            child: new ChatPage(),
          ),
          new Offstage(
            offstage: widget.selectedTabRoute != AppRoute.userMainTab,
            child: new UserPage(),
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
          CounterPage.counterPageBottomNavigationBarItem,
          ChatPage.chatPageBottomNavigationBarItem,
          UserPage.userPageBottomNavigationBarItem,
        ],
      ),
    );

  }
}
