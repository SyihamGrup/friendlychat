import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'package:friendlychat/page/user_page.dart';

import 'package:flutter/foundation.dart';
import 'package:friendlychat/themedata/cupertino_themedata.dart';
import 'package:friendlychat/themedata/default_themedata.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:friendlychat/redux/app_state.dart';
import 'package:friendlychat/redux/app_state_reducer.dart';
import 'package:friendlychat/redux/middleware.dart';
import 'package:friendlychat/page/main_tab_page.dart';


class FriendlychatApp extends StatelessWidget {

  final store = new Store<AppState>(
      appStateReducer,
      initialState: new AppState(),
      middleware: [new EpicMiddleware(allEpics)]
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: "Friendlychat",
        routes: <String, WidgetBuilder> {
          '/': (BuildContext context) => new MainTabPage(),
          '/user' : (BuildContext context) => UserPage()
        },
//        home: new MainTabPage(),
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? kCupertinoThemeData
            : kDefaultThemeData,
      ),
    );
  }
}