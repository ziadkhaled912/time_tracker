import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_model.dart';
import 'package:time_tracker_app/services/auth.dart';

class EmailSignInBloc {

  EmailSignInBloc({@required this.auth});
  final AuthBase auth;

  final StreamController<EmailSignInModel> _modelController =
      StreamController<EmailSignInModel>();

  Stream<EmailSignInModel> get modelStream => _modelController.stream;
  EmailSignInModel _model = EmailSignInModel();

  void dispose() {
    _modelController.close();
  }

Future<void> submit() async {
    updateWith(
      submitted: true,
      isLoading: true,
    );
    try {
      if (_model.formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmail(_model.email, _model.password);
      } else {
        await auth.createUserWithEmail(_model.email, _model.password);
      }
    } catch (e) {
      updateWith(
        submitted: false,
        isLoading: false,
      );
      rethrow;
    }
  }
  /// Toggle form function
  void toggleFormType() {
    final formType = _model.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;
    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email); /// Update email function

  void updatePassword(String password) => updateWith(password: password); /// Update password

  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    // update model
    _model = _model.copyWith(
      email: email,
      password: password,
      isLoading: isLoading,
      submitted: submitted,
      formType: formType,
    );
    // add updated model to _modelController
    _modelController.add(_model);
  }
}