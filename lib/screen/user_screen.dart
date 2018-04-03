import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../component/gradient_background_component.dart';
import '../entity/user_entity.dart';
import '../constant/app_images.dart';
import '../constant/app_strings.dart';


typedef CounterPageDidSignoutAction();
typedef CounterPageDidLoginAction();

class UserPage extends StatefulWidget {

  //static final defaultKey = const Key('__userPage__');

  static final userPageBottomNavigationBarItem = new BottomNavigationBarItem(
    icon: new Icon(Icons.person),
    title: new Text(AppStrings.user),
  );

  final UserEntity user;
  final int currentCounter;
  final CounterPageDidSignoutAction signoutAction;
  final CounterPageDidLoginAction loginAction;

  UserPage({
    Key key,
    @required this.user,
    this.currentCounter: 0,
    @required this.signoutAction,
    @required this.loginAction,
  }) :
      super(key: key); // ?? UserPage.defaultKey);

  @override
  _UserPageState createState() => _UserPageState();

}



class _UserPageState extends State<UserPage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(context),
    );
  }

//
  Widget _buildBody(BuildContext context) {
    return new GradientBackgroundComponent (
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
            child: new CircleAvatar(
              backgroundImage: widget.user.photoUrl == null
                  ? AppImages.placeholderAvatar
                  : new NetworkImage(widget.user.photoUrl),
            ),
          ),

          new Text(
            '${widget.user.displayName} (${widget.currentCounter})',
            textAlign: TextAlign.center,
          ),
          new FlatButton(
            onPressed: () async {
              if (widget.user.isLogged == true) {
                widget.signoutAction();
              } else {
                widget.loginAction();
              }
            },
            child: new Text( widget.user.isLogged == true
                ? AppStrings.logOut
                : AppStrings.signLogIn
            ),
          ),
        ],
      ),
    );
  }


}