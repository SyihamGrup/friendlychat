import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class DefaultAppBar extends AppBar {

  DefaultAppBar({
    this.title
  }) : super(
    title: title,
    centerTitle: defaultTargetPlatform == TargetPlatform.iOS,
    elevation:  defaultTargetPlatform == TargetPlatform.iOS
        ? 0.0
        : 4.0,
  );


  final Widget title;

}