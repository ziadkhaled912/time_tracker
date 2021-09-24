import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  @required Function onPressed,
  @required String text,
  bool isUpperCase = true,
}) =>
    Container(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.blueAccent,
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );

Widget defaultFormField({
  @required String labelText,
  @required TextEditingController controller,
  @required Function validation,
  TextInputType type,
  IconData prefix,
  IconData suffix,
  String hintText,
  Function onSubmit,
  bool secure = false,
  Function onPressed,
}) =>
    TextFormField(
      validator: validation,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(suffix),
        ),
        border: OutlineInputBorder(),
      ),
      keyboardType: type,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: onSubmit,
      obscureText: secure,
    );
