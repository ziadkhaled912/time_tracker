import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/common_widgets/show_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';

class HomePage extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async{
    try{
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
        context,
        title: 'Logout',
        content: 'Are you sure that you want to logout?',
        cancelActionText: 'Cancel',
        defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true){
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: Icon(
          Icons.menu,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
            Icons.close,
          ),
              onPressed: (){},
          ),
          FlatButton(
              onPressed:() => _confirmSignOut(context),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ))
        ],
      ),
      body: Container(
        child: Container(
          decoration: BoxDecoration(

          ),
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                "assets/images/woman-standing-indoor-19267691.png",
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 150,
                ),
                child: Text(
                  'Hello world',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
