import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

import './home.dart';
import './login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
                opacity: 0.8,
                child: Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(
                          "assets/images/splashcreen diary 1.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ), //Image.asset('assets/images/splashcreen diary 1.jpeg')
                )),
            Shimmer.fromColors(
                baseColor: Color(0xffff6363),
                highlightColor: Color(0xffa32f80),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "A Survey That Matters",
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'ASafePlacetoFall',
                        shadows: <Shadow>[
                          Shadow(
                              blurRadius: 18.0,
                              color: Colors.black87,
                              offset: Offset.fromDirection(120, 12))
                        ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
