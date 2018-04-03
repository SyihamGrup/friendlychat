import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:friendlychat/entity/user_entity.dart';




class MessageRespository  {

  const MessageRespository();

  DatabaseReference databaseReference() {
    return FirebaseDatabase.instance.reference().child('messages');
  }


  Future<Null> sendMessage(UserEntity senderUser, String text, File imageFile) async {
    Uri uri;

    if (imageFile != null) {
      uri = await _uriFromImageFile(imageFile);
    }

    databaseReference().push().set({
      'text': text,
      'imageUrl': uri,
      'senderName': senderUser.displayName,
      'senderPhotoUrl': senderUser.photoUrl,
    });
  }

  Future<Uri> _uriFromImageFile(File imageFile) async {
    int random = new Random().nextInt(100000);
    StorageReference ref = FirebaseStorage.instance.ref().child("image_$random.jpg");
    StorageUploadTask uploadTask = ref.put(imageFile);
    Uri downloadUrl = (await uploadTask.future).downloadUrl;

    return downloadUrl;
  }

}