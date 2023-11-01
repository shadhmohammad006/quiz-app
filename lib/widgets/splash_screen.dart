import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/screen1.dart';

import 'package:flutter_application_2/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Optional: For loading animation
import '../color.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        // SplashScreen()), // Navigate to your main content screen
      );
    });

    return Scaffold(
      backgroundColor: first,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
            ),
            // Your logo or branding elements here
            Container(
                child: Image.asset(
                    'asset/images/AGNS.gif')), // Example: Load an image
            SizedBox(height: 200),
            Container(
                // color: Colors.white,
                height: 60,
                width: 60,
                child: Image.asset(
                  'asset/images/download-removebg-preview.png',
                )),

            // SpinKitDoubleBounce(
            //   // Optional: Loading animation
            //   color: Colors.blue,
            //   size: 50.0,
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedprfs = await SharedPreferences.getInstance();

    final _UserLoggedIn = _sharedprfs.getBool(SAVE_KEY_NAME);
    if (_UserLoggedIn == null || _UserLoggedIn == false) {
      LoginScreen();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Screen1()));
    }
  }
}
