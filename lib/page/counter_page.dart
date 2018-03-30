import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:friendlychat/redux/app_state.dart';
import 'package:friendlychat/redux/actions.dart';

final counterPageBottomNavigationBarItem = new BottomNavigationBarItem(
  icon: new Icon(Icons.touch_app),
  title: new Text('Counter'),
);

class CounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder(
      onInit: ((store) {
        store.dispatch(new RequestCounterDataEventsAction());
      }),
      //onDispose: (store) => store.dispatch(new CancelCounterDataEventsAction()),
      onDispose: ((store) {
        store.dispatch(new CancelCounterDataEventsAction());
      }),
      builder: (context, Store<AppState> store) {
        return new Scaffold(
          //appBar: new AppBar(
          //  title: new Text('Counter')
          //),
          body: _buildBody(context, store),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, Store<AppState> store) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('You have pushed the button this many times:'),
          new Text(
            '${store.state.counter}',
            style: Theme.of(context).textTheme.display1,
          ),
          new Divider(
            height: 32.0,
            color: Colors.transparent,
          ),
          new Container(
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
                store.dispatch(new IncrementCounterAction());
              },
            ),
          ),
        ],
      ),
    );
  }


}
