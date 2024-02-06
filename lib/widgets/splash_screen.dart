import 'dart:async';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/screen1.dart';

import 'package:flutter_application_2/widgets/login.dart';


// Optional: For loading animation


// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    checkGoogleLogOrNot();
   // checkUserLoggedIn();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your logo or branding elements here

            Image.asset(
                'asset/images/output-onlinegiftools.gif'), // Example: Load an image
            SizedBox(height: 82),
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

  // Future<void> checkUserLoggedIn() async {
  //   final _sharedprfs = await SharedPreferences.getInstance();

  //   final _UserLoggedIn = _sharedprfs.getBool(SAVE_KEY_NAME);
  //   if (_UserLoggedIn == null || _UserLoggedIn == false) {
  //     LoginScreen();
  //   } else {
  //     Navigator.of(context)
  //         .pushReplacement(MaterialPageRoute(builder: (ctx) => Screen1()));
  //   }
  // }
  //  Future <Void> checkGoogleLogin()async{

  // }
  Future<void> checkGoogleLogOrNot() async {
    UserCredential? userCredential = await signInWithGoogle();
    if (userCredential != true) {
      // Successful sign-in
      print("User signed in: ${userCredential.user!.displayName}");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Screen1(),
        ),
      );
    } else {
      // Sign-in failed msp
      print("Failed to sign in with Google");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  
}
