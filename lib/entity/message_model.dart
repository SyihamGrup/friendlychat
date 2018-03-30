//
//
//
//
//class Message {
//  final String senderPhotoUrl;
//  final String senderName;
//  final String imageUrl;
//  final String text;
//
//  const User(
//      this.senderName,
//      {
//    this.senderPhotoUrl,
//    this.imageUrl,
//    this.text,
//  });
//}
//
//
//
//new NetworkImage(snapshot.value['senderPhotoUrl'])
//),
//),
//new Expanded(
//child: new Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//new Text(snapshot.value['senderName'],
//style: Theme.of(context).textTheme.subhead),
//new Container(
//margin: const EdgeInsets.only(top: 5.0),
//child: snapshot.value['imageUrl'] != null
//? new Image.network(
//snapshot.value['imageUrl'],
//width: 250.0,
//)
//: new Text(snapshot.value['text']),