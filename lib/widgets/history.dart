import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/general_provider.dart';
import 'package:flutter_application_2/screen1.dart';
import 'package:flutter_application_2/widgets/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int mark = 0;
  // List<int> userScores = [];
  // List<String> storedTimes = [];
  List<String> datetimes = [];
  String? datetime;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Provider.of<GeneralProvider>(context, listen: false).getUserScores();
    Provider.of<GeneralProvider>(context, listen: false).loadStoredTimes();
  }

  Future<void> clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> clearPerformance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Future<void> getUserScores() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userScoresString = prefs.getString('user_scores');
  //   //await prefs.clear();
  //   if (userScoresString != null) {
  //     setState(() {
  //       userScores = userScoresString
  //           .split(',')
  //           .map((s) => int.tryParse(s) ?? 0)
  //           .toList();
  //     });
  //   }
  // }

  // Future<void> loadStoredTimes() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final storedTimesList = prefs.getStringList('storedTimes');

  //   setState(() {
  //     storedTimes = storedTimesList ?? [];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          height: 50,
          width: 50,
          decoration:
              BoxDecoration(border: Border.all(), shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => Screen1(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ), // popup menu button
        actions: [
          IconButton(
              onPressed: () {
                logout(context);
              },
              icon: Icon(Icons.exit_to_app)),
          TextButton(
              onPressed: () {
                clearPerformance();
              },
              child: Text(
                'clear performance',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(), shape: BoxShape.circle),
                  child: Image.asset(
                      'asset/images/images__1_-removebg-preview.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 100,
                  width: 190,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 330,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Your Performance",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 400,
              width: 330,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: Provider.of<GeneralProvider>(context)
                          .userScores
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: ListTile(
                            title: Column(
                              children: [
                                Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(children: [
                                      Text(
                                          '${Provider.of<GeneralProvider>(context).storedTimes[index]}'),
                                      Text(
                                        'match: ${index + 1} \n score: ${Provider.of<GeneralProvider>(context).userScores[index]}',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ]))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void logout(BuildContext ctx) async {
    clearSavedData();
    await _auth.signOut();
    await _googleSignIn.signOut();
    print('signed out');
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LoginScreen()), (route) => false);
  }
}
