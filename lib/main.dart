import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/counter/counter_screen.dart';
import 'package:time_tracker_app/app/screens/assetment.dart';
import 'package:time_tracker_app/app/screens/i_am_rich.dart';
import 'package:time_tracker_app/constants.dart';
import 'package:time_tracker_app/services/auth.dart';

void main() async {
  // Bloc observer
  Bloc.observer = MyBlocObserver();
  DioHelper.init(); // Dio Initialize
  Settings.init(); // Setting Initialize
  await CacheHelper.init(); // Cache Initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Khourshed 1809',
        theme:
        ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kPrimaryColor),
            bodyText2: TextStyle(color: kPrimaryColor),
          )
        ),
        home: MyWidget(),
      ),
    );
  }
}