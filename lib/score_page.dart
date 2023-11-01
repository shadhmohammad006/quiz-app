import 'package:flutter/material.dart';
import 'package:flutter_application_2/color.dart';

import 'package:flutter_application_2/screen1.dart';
import 'package:flutter_application_2/widgets/history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Total extends StatefulWidget {
  final int mark;
  const Total({super.key, required this.mark});

  @override
  State<Total> createState() => _TotalState();
}

class _TotalState extends State<Total> {
  // void initstate() {
  //   super.initState();
  //   saveQuizResult();
  //   storeTime();
  // }

  Future<void> storeTime() async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    final storedTimes = prefs.getStringList('storedTimes') ?? [];
    storedTimes.add(now.toString());
    await prefs.setStringList('storedTimes', storedTimes);
  }

  Future<void> saveQuizResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userScoresString = prefs.getString('user_scores');
    prefs.setInt('mark', widget.mark);

    List<int> userScores = [];
    if (userScoresString != null) {
      userScores =
          userScoresString.split(',').map((s) => int.tryParse(s) ?? 0).toList();
    }
    userScores.add(widget.mark);

    prefs.setString('user_scores', userScores.join(','));
  }

  @override
  Widget build(BuildContext context) {
    saveQuizResult();
    storeTime();
    return Scaffold(
      // backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: widget.mark <= 3
                  ? Image.asset('asset/images/crying-baby.gif')
                  : Image.asset("asset/images/gallery_143_38_154737.gif"),
            ),
            Text(
              'Your Score:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.mark}',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(),
                  ),
                );
              },
              child: Text('View History'),
            ),
            IconButton(
              onPressed: () async {
                await saveQuizResult();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen1(),
                  ),
                );
              },
              icon: Icon(
                Icons.home,
                color: first,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
