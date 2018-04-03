import 'dart:async';
import 'package:friendlychat/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class UserRespository  {

  const UserRespository();

  Future<UserEntity> login() async {
    final googleSignIn = new GoogleSignIn();
    GoogleSignInAccount user = googleSignIn.currentUser;

    if (user == null)
      user = await googleSignIn.signInSilently();
    if (user == null) {
      await googleSignIn.signIn();
    }

    FirebaseAuth auth = FirebaseAuth.instance;

    if (await auth.currentUser() == null) {
      GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;

      await auth.signInWithGoogle(
        idToken: credentials.idToken,
        accessToken: credentials.accessToken,
      );
    }

    return UserEntity(
      id: googleSignIn.currentUser.id,
      displayName: googleSignIn.currentUser.displayName,
      photoUrl: googleSignIn.currentUser.photoUrl,
    );
  }

  Future<UserEntity> logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.signOut();

    final googleSignIn = new GoogleSignIn();
    await googleSignIn.signOut();

    return null;
  }

}