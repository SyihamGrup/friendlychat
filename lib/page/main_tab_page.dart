import 'package:flutter/material.dart';
import 'package:friendlychat/page/chat_page.dart';
import 'package:friendlychat/page/counter_page.dart';
import 'package:friendlychat/page/user_page.dart';

class MainTabPage extends StatefulWidget {
  @override
  State createState() => new _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new CounterPage(),
          ),
          new Offstage(
            offstage: index != 1,
            child: new ChatPage(),
          ),
          new Offstage(
            offstage: index != 2,
            child: new UserPage(),
          ),
        ],
      ),

      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).accentColor,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          counterPageBottomNavigationBarItem,
          chatPageBottomNavigationBarItem,
          userPageBottomNavigationBarItem,
        ],
      ),
    );

  }
}
