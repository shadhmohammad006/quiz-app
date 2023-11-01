// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class providerExample with ChangeNotifier {
//   List<int> userScores = [];
//   int mark = 0;

//   Future<void> saveQuizResult() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userScoresString = prefs.getString('user_scores');
//     prefs.setInt('mark', mark);

//     if (userScoresString != null) {
//       userScores =
//           userScoresString.split(',').map((s) => int.tryParse(s) ?? 0).toList();
//     }
//     userScores.add(mark);

//     prefs.setString('user_scores', userScores.join(','));
//     print(userScores);
//   }
// }
import 'package:flutter/material.dart';

class providerdemo with ChangeNotifier{

}