import 'package:flutter/material.dart';

import 'package:friendlychat/friendlychat_app_container.dart';
import 'package:friendlychat/friendlychat_app_ui.dart';
import 'package:friendlychat/controller/main_tab_controller.dart';





class FriendlychatApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FriendlychatAppContainer(
      child: FriendlychatAppUI(
        child: new MaterialApp(
          title: "Friendlychat",
          routes: <String, WidgetBuilder> {
            AppRoute.main.path: (BuildContext context) => new MainTabController(
              selectedTabRoute: AppRoute.counterMainTab,
            ),
          },
          //theme: FriendlychatAppUI.of(context).themeData,
          builder: (context, widget) {
            return new MainTabController(selectedTabRoute: AppRoute.counterMainTab,);
          },
        ),
      ),
    );
  }
}


class AppRouteDetails {
  String path;
  int index;

  AppRouteDetails({
    this.path,
    this.index = 0,
  });

}

class AppRoute {

  AppRouteDetails details;

  static final main = AppRouteDetails(path: "/");

  static final counterMainTab =  AppRouteDetails(path: "/counterMainTab", index: 0,);
  static final chatMainTab = AppRouteDetails(path:"/chatMainTab", index: 1,);
  static final userMainTab = AppRouteDetails(path:"/userMainTab", index: 2,);

  static final chatMessages = AppRouteDetails(path:"/chatMessages");


  AppRoute.fromMainTabIndex(int mainTabIndex) {
    switch (mainTabIndex) {
      case 1: details = AppRoute.chatMainTab; break;
      case 2: details = AppRoute.userMainTab; break;
      default: details = AppRoute.counterMainTab; break;// 0
    }
  }

}