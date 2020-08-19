import 'package:flutter/material.dart';

import './home.dart';
import './splash_screen.dart';
import './survey.dart';
import './archive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/home': (context) => HomeScreen(),
          '/spsc': (context) => SplashScreen(),
          '/survey': (context) => SurveyForm(),
          '/archive': (context) => Archive()
        },
        title: 'Surveyor App',
        theme: ThemeData(
          primarySwatch: Colors.indigo, //[900],
          primaryColor: Colors.indigo, //purple[900],
          //accentColor: Colors.pinkAccent, //[700],
          //accentColor: Colors.pinkAccent[700],
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
