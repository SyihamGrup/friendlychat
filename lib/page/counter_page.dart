import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/component/gradient_background_component.dart';


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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GradientBackgroundComponent(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
        shape: new CircleBorder(
          side: new BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
        child: new Icon(
          Icons.add,
          color: Theme.of(context).primaryColorLight,
        ),
        splashColor: Theme.of(context).highlightColor,
        color: Theme.of(context).accentColor,
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
