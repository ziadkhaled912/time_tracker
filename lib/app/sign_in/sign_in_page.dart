import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_manager.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_app/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_app/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';

import 'email_sign_in_page.dart';

class SignInPage extends StatelessWidget {

  const SignInPage({Key key,@required this.manager, @required this.isLoading}) : super(key: key);
  final SignInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context){
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (_, manager, __) => SignInPage(manager: manager, isLoading: isLoading.value,) ,
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, Exception exception){
    if (exception is FirebaseException && exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
      showExceptionAlertDialog(
        context,
        title: 'Sign in failed',
        exception: exception,
      );
  }

  Future<void> _signInAnonymous(BuildContext context) async {
    try {
      await manager.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  /// Sign sign in with google method

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  /// Sign sign in with facebook method

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await manager.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  /// Sign in with email method
  void _signInWithEmail(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
              'Khourshed 1809',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w600,
              // color: Color(0xfffcc201),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          /// sign in text
          SizedBox(
            height: 48.0,
              child: _buildHeader(),
          ),
          SizedBox(
            height: 48.0,
          ),
          /// sign in with google button

          SocialSignInButton(
            assetName: 'assets/images/google-logo.png',
            /**/
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: isLoading ? null : () =>_signInWithGoogle(context),
          ),
          SizedBox(
            height: 10.0,
          ),

          /// sign in with facebook button

          SocialSignInButton(
            assetName: 'assets/images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: isLoading ? null : () =>_signInWithFacebook(context),
          ),
          SizedBox(
            height: 10.0,
          ),

          /// Sign in with email button

          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: isLoading ? null : () => _signInWithEmail(context),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'or',
            style: TextStyle(fontSize: 16.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: isLoading ? null : () => _signInAnonymous(context),
          ),
        ],
      ),
    );
  }
  /// Is loading indicator

  Widget _buildHeader() {
    if(isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.w600,
        color: Color(0xfffcc201)
      ),
    );
  }
}
