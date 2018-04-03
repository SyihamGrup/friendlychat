import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class GradientBackgroundComponent extends StatelessWidget {

  final Widget child;

  GradientBackgroundComponent({
    Key key,
    @required this.child,
  }) :
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter, //new Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: [Theme.of(context).accentColor, Colors.white], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: this.child,
    );
  }

}