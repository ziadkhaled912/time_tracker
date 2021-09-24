import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_app/common_widgets/primary_button.dart';

class FormSubmitBtn extends CustomRaisedButton {
  FormSubmitBtn({
    @required String text,
    VoidCallback onPressed,
    String child,
}) : super(
    child : Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    ),
    height: 44.0,
    color: Colors.indigo,
    borderRadius: 4.0,
    onPressed: onPressed,
  );
}
