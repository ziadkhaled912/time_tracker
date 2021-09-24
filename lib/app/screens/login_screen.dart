import 'package:flutter/material.dart';
import 'package:time_tracker_app/common_widgets/componants.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool _isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 50,),
                  defaultFormField(
                      labelText: 'Email Address',
                      type: TextInputType.emailAddress,
                      controller: emailController,
                      validation: (value){
                        if(value.isEmpty)
                          return 'Email address must not be empty';

                        return null;
                      },
                    hintText: "enter your email address",
                    prefix: Icons.email,
                  ),
                  SizedBox(height: 16,),
                  defaultFormField(
                      labelText: "Password",
                      hintText: "enter your password",
                      controller: passController,
                      validation: (value){
                        if(value.isEmpty)
                          return 'Password must not be empty';
                        return null;
                      },
                    onPressed: (){
                        setState(() {
                          _isSecure = !_isSecure;
                        });
                    },
                    secure: _isSecure,
                    prefix: Icons.lock,
                    suffix: _isSecure ? Icons.visibility : Icons.visibility_off_rounded,
                  ),
                  SizedBox(height: 20,),
                  defaultButton(
                    text: 'login',
                    onPressed: (){
                      if(formKey.currentState.validate()){
                        print(emailController.text);
                        print(passController.text);
                      }
                      },
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Register Now'
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
