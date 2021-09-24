import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/woman-standing-indoor-19267691.png",
            height: 550,
            // width: 375,
            fit: BoxFit.fill,
          ),
        ],
      ),
      SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 300,),
                      Text(
                        "Khourshed 1809",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Discover the latest copper accessories",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
