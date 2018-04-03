import 'package:flutter/material.dart';
import 'package:friendlychat/repository/messages_repository.dart';
import 'package:friendlychat/repository/user_repository.dart';


import 'flow/main_flow.dart';





class FriendlychatApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",

      routes: <String, WidgetBuilder> {

        AppRoute.main.path: (BuildContext context) {
          return new MainFlow(
            messageRespository: const MessageRespository(),
            userRespository: const UserRespository(),
          );
        },

//        AppRoute.chat.path: (BuildContext context) {
//          return new ChatPage(
//            isLogged: _container.appState.loggedUser != null,
//            databaseReference: _container.appState.databaseReference,
//            loginAction: () => _container.login(),
//            sendMessageAction: (text, imageFile) => _container.sendMessage(text, imageFile),
//          );
//        },

      },

      initialRoute: '/',

      theme: new ThemeData.dark().copyWith(
        primaryColor: Colors.grey[100],
        primaryColorBrightness: Brightness.light,
        accentColor: Colors.blueAccent,
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
  static final userMainTab = AppRouteDetails(path:"/userMainTab", index: 1,);

  static final chat = AppRouteDetails(path:"/chat");


  AppRoute.fromMainTabIndex(int mainTabIndex) {
    switch (mainTabIndex) {
      case 1: details = AppRoute.userMainTab; break;
      default: details = AppRoute.counterMainTab; break;// 0
    }
  }

}