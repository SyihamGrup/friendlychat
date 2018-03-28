import 'package:flutter/material.dart';
import 'package:friendlychat/screen/chat_screen.dart';

import 'package:flutter/foundation.dart';
import 'package:friendlychat/themedata/cupertino_themedata.dart';
import 'package:friendlychat/themedata/default_themedata.dart';


class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kCupertinoThemeData
          : kDefaultThemeData,
    );
  }
}