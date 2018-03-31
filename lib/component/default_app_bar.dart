import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DefaultAppBarComponent extends StatefulWidget implements PreferredSizeWidget {

  final Widget title;
  final PreferredSizeWidget bottom;
  //final Widget leading;

  @override
  final Size preferredSize;

  DefaultAppBarComponent({
    Key key,
    this.title,
    this.bottom,
    //this.leading,
  }) :
        preferredSize = new Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  @override
  State createState() => new _DefaultAppBarComponentState();

}


class _DefaultAppBarComponentState extends State<DefaultAppBarComponent> {

  @override
  Widget build(BuildContext context) {
    Widget appBar = defaultTargetPlatform == TargetPlatform.iOS
        ? _iOSStyleAppBar(context)
        : _androidStyleAppBar(context);

    return appBar;
  }


  Widget _iOSStyleAppBar(BuildContext context) {
    AppBar _appBar = new AppBar(
      title: widget.title,
      bottom: widget.bottom,
      //leading: leading,
      centerTitle: true,
      elevation:  0.0,
    );

//    CupertinoSliverNavigationBar appBar = new CupertinoSliverNavigationBar(
//
//    )

    return Container(
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 1.0,
            color: Theme.of(context).bottomAppBarColor,
          ),
        ),
      ),
      child: _appBar,
    );
  }

  Widget _androidStyleAppBar(BuildContext context) {
    AppBar _appBar = new AppBar(
      title: widget.title,
      bottom: widget.bottom,
      //leading: leading,
    );

    return Container(
      child: _appBar,
    );
  }

}
