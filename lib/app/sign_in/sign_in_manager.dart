import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_app/services/auth.dart';

class SignInManager {
  SignInManager({@required this.auth, @required this.isLoading});
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;


  Future<User> _signIn(Future<User> Function()signInMethod) async {
    try{
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
  /// Sign in anonymously
  Future<User> signInAnonymously() async => await _signIn(auth.signInAnonymously);
  /// Sign in with google
  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);
  /// Sign in with facebook
  Future<User> signInWithFacebook() async => await _signIn(auth.signInWithFacebook);
}