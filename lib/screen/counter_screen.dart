import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../component/gradient_background_component.dart';
import '../constant/app_strings.dart';



typedef CounterPageDidCounterAction();


class CounterPage extends StatefulWidget {

  final int currentCounter;

  final CounterPageDidCounterAction counterAction;


  CounterPage({
    Key key,
    @required this.currentCounter,
    @required this.counterAction,
  }) :
      super(key: key);


  static final bottomNavigationBarItem = new BottomNavigationBarItem(
    icon: new Icon(Icons.touch_app),
    title: new Text('Counter'),
  );

  @override
  State createState() => new _CounterPageState();
}



class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(AppStrings.counter),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GradientBackgroundComponent(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Global pushed times:'),
            new Text(
              '?',
              style: Theme.of(context).textTheme.display2,
            ),
            new Divider(
              height: 32.0,
              color: Colors.transparent,
            ),
            new Text('You have pushed the button this many times:'),
            new Text(
              '${widget.currentCounter}',
              style: Theme.of(context).textTheme.display1,
            ),
            new Divider(
              height: 32.0,
              color: Colors.transparent,
            ),
            _buildCounterButton(context),
          ],
        ),
      ),
    );
  }


  Widget _buildCounterButton(BuildContext context) {
    return new Container(
      width: 100.0,
      height: 100.0,
      child: new FlatButton(
        shape: new CircleBorder(),
        child: new Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
        splashColor: Theme.of(context).accentColor,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          widget.counterAction();
        },
      ),
    );
  }

}



// typedefs



//typedef TodoAdder(Todo todo);
//
//typedef TodoRemover(Todo todo);
//
//typedef TodoUpdater(
//    Todo todo, {
//      bool complete,
//      String id,
//      String note,
//      String task,
//    });
