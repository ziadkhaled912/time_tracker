import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius: 2.0,
    this.onPressed,
    this.padding,
    this.height: 50.0,
});
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double padding;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        // padding: EdgeInsets.all(padding),
        color: color,
        disabledColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            )
        ),
        onPressed: onPressed,
      ),
    );
  }
}
