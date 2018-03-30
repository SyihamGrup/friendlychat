import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class DefaultAppBar extends AppBar {

  DefaultAppBar({
    this.title,
    this.bottom,
    this.leading,
  }) : super(
    leading: leading,
    bottom: bottom,
    title: title,
    centerTitle: defaultTargetPlatform == TargetPlatform.iOS,
    elevation:  defaultTargetPlatform == TargetPlatform.iOS
        ? 0.0
        : 4.0,
  );


  final Widget title;
  final PreferredSizeWidget bottom;
  final Widget leading;

}