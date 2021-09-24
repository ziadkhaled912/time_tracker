import 'package:flutter/cupertino.dart';
import 'package:time_tracker_app/common_widgets/primary_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,

})  : super(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 18,),
        ),
        color: color,
        borderRadius: 40.0,
        height: 50.0,
        padding: 20.0,
        onPressed: onPressed,
  );
}