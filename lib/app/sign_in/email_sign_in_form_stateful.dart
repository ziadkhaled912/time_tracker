import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_model.dart';
import 'package:time_tracker_app/app/sign_in/validators.dart';
import 'package:time_tracker_app/common_widgets/form_submit_btn.dart';
import 'package:time_tracker_app/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';


class EmailSignInFormStateful extends StatefulWidget with EmailAndPasswordValidators {

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInFormStateful> {
  /// Variables
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  /// submit form bool
  bool _submitted = false;
  /// is loading bool
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  /// submit function
  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      if (_formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmail(_email, _password);
      } else {
        await auth.createUserWithEmail(_email, _password);
      }
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      showExceptionAlertDialog(
          context,
          title: 'Sign in failed',
          exception: e,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Email validation
  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email)
    ? _passwordFocusNode : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  /// Toggle From type
  void _toggleFromType() {
    setState(() {
      _submitted = false;
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  /// Email

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Don\'t Have an account ? Register'
        : 'Have an account? Sign in';

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.emailValidator.isValid(_password) && !_isLoading;

    Widget _onIsLoading() {
      if(_isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return FormSubmitBtn(
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      );
    }
    return [
      /// Email Text field
      _buildEmailTextField(),
      SizedBox(
        height: 8.0,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 12.0,
      ),

      /// Submit button
      ///
      _onIsLoading(),
      TextButton(
        onPressed: !_isLoading ? _toggleFromType : null,
        child: Text(secondaryText),
      )
    ];
  }


  TextField _buildPasswordTextField() {

    bool showErrorText =_submitted && !widget.passwordValidator.isValid(_password);

    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Your Password',
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        enabled: _isLoading == false,
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
      onChanged: (password) => _updateState(),
    );
  }

  TextField _buildEmailTextField() {

    bool showErrorText =_submitted && !widget.emailValidator.isValid(_email);

    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'example@test.com',
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
        enabled: _isLoading == false,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingComplete,
      onChanged: (email) => _updateState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  void _updateState() {
    setState(() {
    });
  }
}
/// is loading widget
