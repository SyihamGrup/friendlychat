import 'package:meta/meta.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

@immutable
class AppState {

//  final googleSignIn = new GoogleSignIn();
//  final analytics = new FirebaseAnalytics();
//  final auth = FirebaseAuth.instance;

  final int counter;

  AppState({
    this.counter = 0,
  });

  AppState copyWith({int counter}) => new AppState(counter: counter ?? this.counter);

}
