import 'package:firebase_database/firebase_database.dart';


class MessageEntity {

  final String senderPhotoUrl;
  final String senderName;
  final String imageUrl;
  final String text;


  MessageEntity._(
    this.senderName,
    this.senderPhotoUrl,
    this.imageUrl,
    this.text,
  );


  factory MessageEntity(DataSnapshot snapshot) {
    return new MessageEntity._(
      snapshot.value['imageUrl'],
      snapshot.value['senderName'],
      snapshot.value['imageUrl'],
      snapshot.value['text'],
    );
  }

}
