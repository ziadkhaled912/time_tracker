
import 'package:flutter/foundation.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_model.dart';
import 'package:time_tracker_app/app/sign_in/validators.dart';
import 'package:time_tracker_app/services/auth.dart';

class EmailSignInChangeModel with EmailAndPasswordValidators, ChangeNotifier{
  EmailSignInChangeModel({
    @required this.auth,
    this.email = '',
    this.password = '',
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });
  final AuthBase auth;
  String email;
  String password;
  EmailSignInFormType formType;
  bool isLoading;
  bool submitted;

  Future<void> submit() async {
    updateWith(
      submitted: true,
      isLoading: true,
    );
    try {
      if (formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmail(email, password);
      } else {
        await auth.createUserWithEmail(email, password);
      }
    } catch (e) {
      updateWith(
        submitted: false,
        isLoading: false,
      );
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = this.formType == EmailSignInFormType.signIn
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


  String get primaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
  }
  String get secondaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? 'Don\'t Have an account ? Register'
        : 'Have an account? Sign in';
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        emailValidator.isValid(password) && !isLoading;
  }

  String get passwordErrorText {
    bool showErrorText = submitted &&
        !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }
  String get emailErrorText {
    bool showErrorText = submitted &&
        !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }
  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
      this.email =  email ?? this.email;
      this.password = password ?? this.password;
      this.formType = formType ?? this.formType;
      this.isLoading = isLoading ?? this.isLoading;
      this.submitted = submitted ?? this.submitted;
      notifyListeners();
  }
}