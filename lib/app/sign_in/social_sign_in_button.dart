import 'package:flutter/cupertino.dart';
import 'package:time_tracker_app/common_widgets/primary_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,

  })  : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(assetName),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
          )
        ),
        Opacity(
            opacity: 0,
            child: Image.asset(assetName)),
      ],
    ),
    color: color,
    borderRadius: 40.0,
    height: 55.0,
    padding: 20.0,
    onPressed: onPressed,
  );
}