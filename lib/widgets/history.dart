import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen1.dart';
import 'package:flutter_application_2/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int mark = 0;
  List<int> userScores = [];
  List<String> storedTimes = [];
  List<String> datetimes = [];
  String? datetime;

  @override
  void initState() {
    super.initState();
    getUserScores();
    loadStoredTimes();
  }

  Future<void> getUserScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userScoresString = prefs.getString('user_scores');
    //await prefs.clear();
    if (userScoresString != null) {
      setState(() {
        userScores = userScoresString
            .split(',')
            .map((s) => int.tryParse(s) ?? 0)
            .toList();
      });
    }
  }

  Future<void> clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> loadStoredTimes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTimesList = prefs.getStringList('storedTimes');

    setState(() {
      storedTimes = storedTimesList ?? [];
    });
  }

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
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                value: 1,
                // row has two child icon and text.
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          clearSavedData();
                        },
                        child: Icon(Icons.clear)),
                    Text("clear history")
                  ],
                ),
              ),
              // popupmenu item 2
              PopupMenuItem(
                value: 2,
                // row has two child icon and text
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          logout(context);
                        },
                        child: Icon(Icons.logout)),
                    Text('Log out')
                  ],
                ),
              ),
            ],
            offset: Offset(0, 100),
            color: Colors.grey,
            elevation: 2,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                // Container(
                //     margin: EdgeInsets.only(left: 270),
                //     height: 50,
                //     width: 50,
                //     decoration: BoxDecoration(
                //         border: Border.all(), shape: BoxShape.circle),
                //      child:
                //     // PopupMenuItem(
                //     //   child: Column(children: [
                //     //     TextButton(onPressed: () {}, child: Text('Clear data'))
                //     //   ]),
                //     // )
                //     // IconButton(
                //     //   onPressed: () {
                //     //     //
                //     //   },
                //     //   icon: Icon(Icons.),
                //     // ),
                //     )
              ],
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
                      itemCount: userScores.length,
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
                                      Text('${storedTimes[index]}'),
                                      Text(
                                        'match: ${index + 1} \n score: ${userScores[index]}',
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

  void logout(BuildContext ctx) {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LoginScreen()), (route) => false);
  }
}
